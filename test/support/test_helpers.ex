defmodule MenuMonkey.TestHelpers do
  alias MenuMonkey.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      email: "Some User",
      username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
      password: "supersecret",
    }, attrs)

    %MenuMonkey.User{}
    |> MenuMonkey.User.registration_changeset(changes)
    |> Repo.insert!()
  end

end


