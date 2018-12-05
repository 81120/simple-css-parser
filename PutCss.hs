module PutCss where

import CSS

putCssRule :: Rule -> String
putCssRule (Rule k v) = k ++ ":" ++ v ++ ";"

putCssRuleSet :: RuleSet -> String
putCssRuleSet (RuleSet selector rules) = selector ++ " {" ++ (unwords $ map putCssRule rules)  ++ "}"
