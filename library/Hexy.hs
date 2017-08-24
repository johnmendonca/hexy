module Hexy
  ( HexShow(..)
  , xshow
  , xshowp
  , xshowu
  , xshowpu
  , xshowl
  , xshowlp
  , xshowlu
  , xshowlpu
  ) where

import Hexy.Internal

import Data.Int
import Data.Word
import qualified Data.Text as Text
import qualified Data.Text.Lazy as Text.Lazy
import Data.Text.Lazy.Builder (Builder)
import qualified Data.Text.Lazy.Builder as Text.Lazy.Builder

-- | Conversion of values to hexadecimal 'String's.
class HexShow a where
  xbuild :: a -> Builder
  xbuildu :: a -> Builder

xshow :: HexShow a => a -> Text.Text
xshow = Text.Lazy.toStrict . xshowl

xshowp :: HexShow a => a -> Text.Text
xshowp = Text.Lazy.toStrict . xshowlp

xshowu :: HexShow a => a -> Text.Text
xshowu = Text.Lazy.toStrict . xshowlu

xshowpu :: HexShow a => a -> Text.Text
xshowpu = Text.Lazy.toStrict . xshowlpu

xshowl :: HexShow a => a -> Text.Lazy.Text
xshowl = Text.Lazy.Builder.toLazyText . xbuild

xshowlp :: HexShow a => a -> Text.Lazy.Text
xshowlp = Text.Lazy.Builder.toLazyText . prefixHex . xbuild

xshowlu :: HexShow a => a -> Text.Lazy.Text
xshowlu = Text.Lazy.Builder.toLazyText . xbuildu

xshowlpu :: HexShow a => a -> Text.Lazy.Text
xshowlpu = Text.Lazy.Builder.toLazyText . prefixHex . xbuildu

instance HexShow Int where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Int8 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Int16 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Int32 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Int64 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Word where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Word8 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Word16 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Word32 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

instance HexShow Word64 where
  xbuild = xbuildStorable
  xbuildu = xbuilduStorable

