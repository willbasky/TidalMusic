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

bindir     = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/bin"
libdir     = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/lib/x86_64-linux-ghc-8.10.4/Tidal-0.0.0.0-4mu5NhKiSA05oiQRIeSSMc"
dynlibdir  = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/share/x86_64-linux-ghc-8.10.4/Tidal-0.0.0.0"
libexecdir = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/libexec/x86_64-linux-ghc-8.10.4/Tidal-0.0.0.0"
sysconfdir = "/home/metaxis/sources/Haskell/play/TidalMusic/.stack-work/install/x86_64-linux-tinfo6/b33b0797e4e8206446087bc8d80bd25440c7663eb4d082ba2d048987f7daa989/8.10.4/etc"

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
