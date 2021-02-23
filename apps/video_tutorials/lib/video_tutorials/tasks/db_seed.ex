defmodule VideoTutorials.Tasks.DbSeed do
  import VideoTutorials.Tasks

  def exec do
    seed(:video_tutorials, [VideoTutorials.Repo])
  end

  def seed(app, repos) do
    start_services(app, repos)

    run_seeds(app)

    stop_services()
  end

  def run_seeds(app) do
    IO.puts("Running seed script..")
    seed_script = Path.join([:code.priv_dir(app), "repo/seeds.exs"])
    Code.eval_file(seed_script)
  end
end
