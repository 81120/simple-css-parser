module CSS where

data Rule = Rule String String deriving (Show)
data RuleSet = RuleSet String [Rule] deriving (Show)
