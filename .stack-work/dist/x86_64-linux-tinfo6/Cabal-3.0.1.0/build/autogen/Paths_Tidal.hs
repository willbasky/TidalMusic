{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Tidal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/bin"
libdir     = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/lib/x86_64-linux-ghc-8.8.4/Tidal-0.0.0.0-F8Sb7rI86JT8OJgSNsPvcE"
dynlibdir  = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/share/x86_64-linux-ghc-8.8.4/Tidal-0.0.0.0"
libexecdir = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/libexec/x86_64-linux-ghc-8.8.4/Tidal-0.0.0.0"
sysconfdir = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/6d4b0d3bdd8193298faf23c13c6bbfc01bf787de5edce945d4d4adf9a25fdcf4/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Tidal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Tidal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Tidal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Tidal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Tidal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Tidal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
