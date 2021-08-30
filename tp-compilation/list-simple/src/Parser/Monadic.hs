{-# LANGUAGE FlexibleInstances, LambdaCase #-}

module Parser.Monadic where

import Control.Applicative
import Data.Char

import Syntax

-------------------------------------------------------------------------------
-- main types & functions
-------------------------------------------------------------------------------

type Result v = Either String (v, String)

newtype Parser v = Parser { runParser :: String -> Result v }

itemP :: Parser Char 
itemP = Parser $ \case 
    (x:xs) -> Right (x, xs)
    [] -> Left "no input"

parseList :: String -> Either String List
parseList input = case runParser listP input of
    Right (v1, _) -> Right v1
    Left err -> Left err

-------------------------------------------------------------------------------
-- instances
-------------------------------------------------------------------------------

instance Functor Parser where

    -- (a -> b) -> f a -> f b
    fmap f (Parser p) = 
        Parser $ \d0 -> do
            (x, d1) <- p d0
            return (f x, d1)

instance Applicative Parser where

    -- a -> f a
    pure x = Parser $ \d -> Right (x, d)

    -- f (a -> b) -> f a -> f b
    (Parser p1) <*> (Parser p2) =
        Parser $ \d0 -> do
            (f, d1) <- p1 d0
            (a, d2) <- p2 d1
            return (f a, d2)

instance Monad Parser where

    -- m a -> (a -> m b) -> m b
    (Parser p1) >>= f2 = 
        Parser $ \d0 -> do
            (a, d1) <- p1 d0
            (b, d2) <- runParser (f2 a) d1
            return (b, d2)

instance Alternative (Either String) where

    -- empty :: f a 
    empty = Left "no parse"

    -- (<|>) :: f a -> f a -> f a
    Left _ <|> e2 = e2
    e1 <|> _ = e1

instance Alternative Parser where

    -- empty :: f a 
    empty = Parser $ const empty

    -- (<|>) :: f a -> f a -> f a
    (Parser p1) <|> (Parser p2) = Parser $ \input -> p1 input <|> p2 input

-------------------------------------------------------------------------------
-- parsing primitives
-------------------------------------------------------------------------------

satisfyP :: (Char -> Bool) -> Parser Char
satisfyP p = do
    x <- itemP
    if p x then return x else empty

charP :: Char -> Parser Char
charP _c = Parser $ const $ Left "TODO"

digitP :: Parser Int
digitP = do
    x <- satisfyP isDigit
    return $ digitToInt x

digitListP :: Parser [Int]
digitListP = alt1 <|> alt2 <|> alt3
    where
        alt1 = do
            x <- digitP
            _ <- charP ' '
            xs <- digitListP
            return (x:xs)
        alt2 = do
            x <- digitP
            return [x]
        alt3 = return []

listP :: Parser List
listP = Parser $ const $ Left "TODO"

