#!/usr/bin/env stack
-- stack script --resolver lts-9.1 --package aeson --package aeson-qq --package stache --package text

{-# LANGUAGE QuasiQuotes #-}

import Data.Aeson (Value)
import Data.Aeson.QQ (aesonQQ)
import qualified Data.Text.Lazy.IO as Text.Lazy.IO
import Text.Mustache (Template, renderMustache)
import Text.Mustache.Compile.TH (mustache)

main :: IO ()
main = Text.Lazy.IO.putStr . renderMustache template $ json

template :: Template
template = [mustache|{{#types}}
{-# SPECIALIZE textShowIntAtBase :: {{a}} -> (Int -> Char) -> {{a}} -> Text.Text #-}
{{/types}}
|]

json :: Value
json = [aesonQQ|{
  types: [
    {a: "Int"},
    {a: "Int8"},
    {a: "Int16"},
    {a: "Int32"},
    {a: "Int64"},
    {a: "Word"},
    {a: "Word8"},
    {a: "Word16"},
    {a: "Word32"},
    {a: "Word64"}
  ]
}|]

