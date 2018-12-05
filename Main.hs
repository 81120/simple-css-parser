module Main where

import PutCss
import CSS
import Text.Parsec
import Text.Parsec.String
import Parse

main :: IO ()
main = do 
  putStrLn . putCssRule $ Rule "background-color" "#fff"
  case (parse parseRule "parse rule" "background-color: #fff;") of
    Left err -> putStrLn $ "exception: " ++ show err
    Right rule -> putStrLn $ putCssRule rule 
  case (parse parseRuleSet "parse rule set" ".myclass {color: #fff;}") of 
    Left err -> putStrLn $ "exception: " ++ show err
    Right ruleSet -> putStrLn $ putCssRuleSet ruleSet
