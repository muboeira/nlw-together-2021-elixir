defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, return the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Du" => 28.964734689002356,
          "Dudu" => 27.92021262315767,
          "Edu" => 26.88095170007721,
          "Rafael" => 25.082863029651524,
          "Rafaela" => 27.339911999658252
        }
      }

      assert expected_response == response
    end

    test "when there are invalid params, return an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "error while opening file"}

      assert expected_response == response
    end
  end
end
