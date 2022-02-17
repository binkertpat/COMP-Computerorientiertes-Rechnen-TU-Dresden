function [x y] = helperFunction_manipulateArrayForBetterViewing(uniqueNumbers, K1, depth)  
     % each numbers that existing in this array
     vectorOfUniqueElements = unique(K1);
     % number of times each unique value is repeated
     for i = 1:length(vectorOfUniqueElements)
       countRepeating(i,1) = sum(K1 == vectorOfUniqueElements(i)); 
     end
     MatrixOfRepeatingCount = [vectorOfUniqueElements(:), countRepeating(:)];
     %disp(MatrixOfRepeatingCount);
     
     % set count for all to 0
     for i = 1:length(MatrixOfRepeatingCount(:,1))
         MatrixOfRepeatingCount(i,2) = 0;
     end
     %disp(MatrixOfRepeatingCount)
 
     %just add if depth isnt reached
     for i = 1:length(uniqueNumbers)
         for j = 1:length(MatrixOfRepeatingCount(:,1))
             if K1(i) == MatrixOfRepeatingCount(j,1) && MatrixOfRepeatingCount(j,2) >= 0 && MatrixOfRepeatingCount(j,2) < depth
                 MatrixOfRepeatingCount(j,2) = MatrixOfRepeatingCount(j,2) + 1;
             elseif K1(i) == MatrixOfRepeatingCount(j,1) && MatrixOfRepeatingCount(j,2) == depth
                 uniqueNumbers(i) = -1;
                 K1(i) = -1;
             end
         end
     end

     K1(K1 == -1) = [];
     uniqueNumbers(uniqueNumbers == -1) = [];
  
     x = uniqueNumbers;
     y = K1;
end