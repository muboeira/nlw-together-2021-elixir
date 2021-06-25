defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Du" => 28.964734689002356,
           "Dudu" => 27.92021262315767,
           "Edu" => 26.88095170007721,
           "Rafael" => 25.082863029651524,
           "Rafaela" => 27.339911999658252
         }}

      assert expected_response == response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "error while opening file"}

      assert expected_response == response
    end
  end
end
