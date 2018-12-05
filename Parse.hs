module Parse where 

import Text.Parsec
import Text.Parsec.String
import Control.Applicative hiding ((<|>))
import CSS

parseRule :: Parser Rule
parseRule = do
  k <- (many1 $ letter <|> char '-') <* char ':' <* spaces
  v <- many1 (noneOf ";") <* char ';' <* spaces
  return $ Rule k v

parseSelector :: Parser String
parseSelector = many1 (oneOf ".#" <|> letter <|> digit) <* spaces

parseRuleSet :: Parser RuleSet
parseRuleSet = do
  s <- parseSelector `sepBy1` spaces
  r <- (char '{' <* spaces) *> many1 parseRule <* (char '}' <* spaces)
  return $ RuleSet (unwords s) r
  
