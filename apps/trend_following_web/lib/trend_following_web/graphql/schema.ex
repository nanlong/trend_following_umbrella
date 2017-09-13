defmodule TrendFollowingWeb.Graphql.Schema do
  use Absinthe.Schema

  import_types TrendFollowingWeb.Graphql.Types.Dayk
  import_types TrendFollowingWeb.Graphql.Types.Stock
  
  query do
    field :dayk, list_of(:dayk) do
      arg :symbol, non_null(:string), description: "股票代码"
      resolve &TrendFollowingWeb.Graphql.Resolver.Dayk.all/2
    end

    field :hk_stock, :hk_stock do
      arg :symbol, non_null(:string), description: "股票代码"
      resolve &TrendFollowingWeb.Graphql.Resolver.Stock.hk_stock/2
    end
  end
end