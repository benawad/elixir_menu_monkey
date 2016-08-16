defmodule MenuMonkey.User do
  use MenuMonkey.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password_hash])
    |> validate_required([:username, :email, :password_hash])
  end
end
