module Lib
    ( orgMain
    ) where

import Data.OrgMode

orgMain :: IO ()
orgMain = do
  input <- orgFile <$> getContents
  putStrLn $ unlines $ showNode <$> odNodes input

showNode :: Node -> String
showNode n = unwords [ replicate (nDepth n) '*' , nTopic n ] ++ "\n" ++
             concat [ showNode cn
                    | ChildNode cn <- nChildren n
                    ]




