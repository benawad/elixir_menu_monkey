defmodule MenuMonkey.User do
  use MenuMonkey.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:username, :email], [])
    |> validate_length(:username, min: 3, max: 20)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
        %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
            put_change(changeset, :password_hash,
            Comeonin.Bcrypt.hashpwsalt(pass))
        _ ->
            changeset
    end
  end

end
