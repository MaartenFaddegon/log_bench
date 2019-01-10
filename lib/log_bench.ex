defmodule LogBench do
  require Logger
  require LagerX

  defmacro info(msg), do: quote do: LagerX.info(unquote(msg))
  defmacro info(fmt, args), do: quote do: LagerX.info(unquote(fmt), unquote(args))


  defmacro logger_info(msg), do: quote do: Logger.info(fn() -> unquote(msg) end)
  defmacro logger_info(fmt, args), do: quote do: Logger.info(fn() -> :io_lib.format(unquote(fmt), unquote(args)) end)


  def run() do
    complex_term = %{one: "een", two: 2, three: %{mylist: [:a, :b, :c], bin: <<7,8,9>>}}
    Benchee.run(%{
      "Logger base"               => fn -> Logger.info "this is a test message" end,
      "Lager base"                => fn -> info "this is a test message" end,

      "Logger inspect int"        => fn -> Logger.info "this is a test message #{inspect 3}" end,
      "Logger inspect int fn"     => fn -> Logger.info fn -> "this is a test message #{inspect 3}" end end,
      "Logger format int"         => fn -> logger_info "this is a test message ~p", [3] end,
      "Lager format int"          => fn -> info "this is a test message ~p", [3] end,
      "Lager inspect int"         => fn -> info "this is a test message #{inspect 3}" end,

      "Logger inspect complex"    => fn -> Logger.info "this is a test message #{inspect complex_term}" end,
      "Logger inspect complex fn" => fn -> Logger.info fn -> "this is a test message #{inspect complex_term}" end end,
      "Logger format complex"     => fn -> logger_info "this is a test message ~p", [complex_term] end,
      "Lager format complex"      => fn -> info "this is a test message ~p", [complex_term] end,
      "Lager inspect complex"     => fn -> info "this is a test message #{inspect complex_term}" end,
    }, time: 10, memory_time: 2)
  end

end
