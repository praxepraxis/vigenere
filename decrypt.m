% UNIVERSIDAD DEL TURABO, SUAGM
% CPEN-503: Computer & Network Security
% Appendix 4 to problem set 3
% Function decrypt for the Vigenere
% Version 1.0
% Author: Carro, M.A. et al.
% Date: October 14, 2016

%The MIT License (MIT)
%Copyright (c) 2016 Carro et al.

%Permission is hereby granted, free of charge, to any person obtaining a copy of 
%this software and associated documentation files (the "Software"), to deal in 
%the Software without restriction, including without limitation the rights to 
%use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
%of the Software, and to permit persons to whom the Software is furnished to do 
%so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included in all 
%copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
%SOFTWARE.

## Author: Carro et al.
## Created: 2016-10-14

% ------------------------------------------------------------------------------

% FUNCTION SYNTAX

% pi = encrypt(Ci, ki)

% This function enciphers the one-to-one correspondence for every numerical Ci 
% of the ciphertext and ki of the key to produce the ith plaintext numerical,
% pi.


% ------------------------------------------------------------------------------


function [p] = decrypt (C, k)

alphabet = ['a':'z'];

if (C+k == length(alphabet))
    p = length(alphabet);
    elseif (length(C) > length(k))
    p = mod(C-k, length(alphabet));
    else 
    p = mod(C-k+length(alphabet), length(alphabet));
end


endfunction
