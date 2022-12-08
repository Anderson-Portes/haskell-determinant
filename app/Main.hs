module Main (main) where

import System.IO
import Data.Time

type Row = [Int]
type Matrix = [Row] 

prompt :: String -> IO String
prompt str = do
  putStr str
  hFlush stdout
  getLine

checkIsSquare :: Matrix -> Bool
checkIsSquare matrix = all (\x -> length x == length matrix) matrix

generateMatriz :: Int -> Matrix
generateMatriz size = [[(size*k)+r | r <- [1..size]] | k <- [0..size-1]]

removeRowAndCol :: Matrix -> Int -> Int -> Matrix
removeRowAndCol m row col = [[m !!r !! k | r <- [0..lenM], r /= row] | k <- [0..lenM], k /= col]
  where
    lenM = (length m) - 1
    
getDetSingleElement :: Matrix -> Int -> Int
getDetSingleElement m i = (m !! 0 !! i) * (-1)^i * singleDet
  where
    singleDet = det $ removeRowAndCol m 0 i

det :: Matrix -> Int
det matrix
  | not $ checkIsSquare matrix = error "A matriz não é quadrada"
  | lenM == 2 = det2X
  | otherwise = sum $ fmap (\x -> getDetSingleElement matrix x) indexElements
  where
    lenM = length matrix
    indexElements = [0..lenM-1]
    det2X = (matrix !! 0 !! 0 * matrix !! 1 !! 1) - (matrix !! 1 !! 0 * matrix !! 0 !! 1)

showM :: Matrix -> String
showM [] = ""
showM (x:xs) = show x ++ "\n" ++ showM xs

main :: IO ()
main = do
  sizeM <- prompt "Digite o tamanho da matriz: "
  initialTime <- getCurrentTime
  let matrix = generateMatriz (read sizeM :: Int)
  putStrLn $ showM matrix
  putStrLn $ "Determinante: " ++ (show.det) matrix
  finalTime <- getCurrentTime
  -- The time will be given in milliseconds but the string will be in seconds
  putStrLn $ "Tempo de execução: " ++ show (diffUTCTime finalTime initialTime * 1000)