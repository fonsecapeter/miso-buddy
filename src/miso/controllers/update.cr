require "../mvc/controller"
require "../utils/loader"
require "../views/errors/error"
require "../views/update/*"

# Get the latest Miso
class UpdateController < Controller
  use_message_view UpdateStart

  def action
    begin
      src_dir = update_src
      install_src(src_dir)
    rescue ex : ShellException
      error_msg = ex.message
      return render ErrorMessageView if error_msg.is_a?(Nil)
      return render ErrorMessageView, context = {
        "error_message" => error_msg
      }
    end
    render UpdateSuccessMessageView
  end

  private def check_outcome(status_code, command)
    if status_code != 0
      raise ShellException.new(
        "Process exited with status_code: #{status_code} :(\n" \
        "=> #{command}"
      )
    end
  end

  private def run_shell(command, status_chan)
    status_chan.send(
      Process.run(
        command,
        shell: true
      ).exit_status
    )
  end

  private def whirl_with_shell(command)
    loader = Loader.new
    status_chan = Channel(Int32).new(1)
    spawn run_shell(command, status_chan)
    while status_chan.empty?
      loader.whirl
    end
    loader.clear
    return status_chan.receive
  end

  private def miso_root_is_dir?
    Dir.exists?(File.expand_path(Miso::ROOT_DIR))
  end

  private def update_src
    if miso_root_is_dir?
      src_dir = Miso::ROOT_DIR
      git_cmd = "cd #{src_dir} && git checkout master && git pull origin master"
    else
      src_dir = File.expand_path("~/.miso")
      git_cmd = "git clone #{Miso::HOMEPAGE} #{src_dir}"
    end
    git_stat = whirl_with_shell(git_cmd)
    check_outcome(git_stat, git_cmd)
    src_dir
  end

  private def install_src(src_dir)
    install_cmd = "make -C \"#{src_dir}\" reinstall"
    install_stat = whirl_with_shell(install_cmd)
    check_outcome(install_stat, install_cmd)
  end
end

class ShellException < Exception
end
