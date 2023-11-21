{-# LANGUAGE DeriveGeneric #-}

-- | Implémentation du jeu de [Tic-tac-toe](https://fr.wikipedia.org/wiki/Tic-tac-toe).
module Tictactoe.Game 
    ( Board
    , Cell(..)
    , Player(..)
    , Game(..)
    , Status(..)
    , isRunning
    , newGameX
    , newGameO
    , play
    , reset
    , whoCanPlay
    , k2ij
    , ij2k
    ) where

import Data.Aeson 
import Data.Vector as V
import GHC.Generics

-- | Type représentant les joueurs : X ou O.
data Player
    = PlayerX   -- ^ joueur X
    | PlayerO   -- ^ joueur O
    deriving (Eq, Generic, Ord, Show)

-- | Type représentant des cases du plateau de jeu.
data Cell 
    = CellE   -- ^ case vide
    | CellX   -- ^ case occupée par un pion du joueur X
    | CellO   -- ^ case occupée par un pion du joueur O
    deriving (Eq, Generic, Show)

-- | Type représentant le status du jeu
data Status
    = StatusPlayX   -- ^ c'est à X de jouer
    | StatusPlayO   -- ^ c'est à O de jouer
    | StatusWinX    -- ^ X a gagné
    | StatusWinO    -- ^ O a gagné
    | StatusTie     -- ^ match nul
    deriving (Eq, Generic, Show)

-- | Plateau de jeu.
type Board = Vector Cell

-- | Jeu de Tictactoe.
data Game = Game
    { _firstPlayer    :: Player   -- ^ joueur qui a commencé la partie courante
    , _status         :: Status   -- ^ état de la partie courante
    , _nbMoves        :: Int      -- ^ nombre de coups joués
    , _board          :: Board    -- ^ plateau
    } deriving (Eq, Generic, Show)

-- | Crée un nouveau jeu où le joueur X commence.
newGameX :: Game
newGameX = Game PlayerX StatusPlayX 0 newBoard

-- | Crée un nouveau jeu où le joueur O commence.
newGameO :: Game
newGameO = Game PlayerO StatusPlayO 0 newBoard

-- | Crée une nouvelle partie en changeant le joueur qui commence.
reset :: Game -> Game
reset Game {_firstPlayer} =
    if _firstPlayer == PlayerX then newGameO else newGameX

-- | Retourne si la partie est encore en cours.
isRunning :: Game -> Bool
isRunning Game {_status} = 
    _status == StatusPlayX || _status == StatusPlayO

-- | Retourne l'éventuel joueur qui doit jouer.
whoCanPlay :: Game -> Maybe Player
whoCanPlay (Game _ StatusPlayX _ _) = Just PlayerX
whoCanPlay (Game _ StatusPlayO _ _) = Just PlayerO
whoCanPlay _ = Nothing

-- | Joue un coup. Si le coup n'est pas valide, le même jeu est retourné.
play :: Int -> Int -> Game -> Game
play i j g@(Game p0 s m b) =
    if not (isRunning g) || i<0 || i>2 || j<0 || j>2 || b!k /= CellE 
    then g
    else Game p0 s' m' b'
    where 
        k = ij2k i j
        c = statusToCell s
        b' = b // [(k, c)]
        m' = m + 1
        s' = findStatus i j m' b'

-- | Calcule la position 2D à partir de l'indice 1D, dans le plateau de jeu.
k2ij :: Int -> (Int, Int)
k2ij k = (div k 3, rem k 3)

-- | Calcule l'indice 1D à partir de la position 2D, dans le plateau de jeu.
ij2k :: Int -> Int -> Int
ij2k i j = i*3 + j

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

(.!) :: Vector a -> (Int, Int) -> a
b .! (i, j) = b ! ij2k i j

newBoard :: Board
newBoard = V.replicate 9 CellE

statusToCell :: Status -> Cell
statusToCell StatusPlayX = CellX
statusToCell StatusPlayO = CellO
statusToCell _ = error "no cell for this status"

cellToStatus :: Bool -> Cell -> Int -> Status
cellToStatus True CellX _ = StatusWinX
cellToStatus True CellO _ = StatusWinO
cellToStatus False _ 9 = StatusTie
cellToStatus False CellX _ = StatusPlayO
cellToStatus False CellO _ = StatusPlayX
cellToStatus _ CellE _ = error "no status for this cell"

findStatus :: Int -> Int -> Int -> Board -> Status 
findStatus i j m b =
    if  b.!(i,0) == c && b.!(i,1) == c && b.!(i,2) == c ||
        b.!(0,j) == c && b.!(1,j) == c && b.!(2,j) == c ||
        b.!(0,0) == c && b.!(1,1) == c && b.!(2,2) == c ||
        b.!(0,2) == c && b.!(1,1) == c && b.!(2,0) == c 
    then cellToStatus True c m
    else cellToStatus False c m
    where c = b.!(i,j)

instance FromJSON Player

instance ToJSON Player where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON Status

instance ToJSON Status where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON Cell

instance ToJSON Cell where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON Game

instance ToJSON Game where
    toEncoding = genericToEncoding defaultOptions


