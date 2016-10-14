% UNIVERSIDAD DEL TURABO, SUAGM
% CPEN-503: Computer & Network Security
% Problem Set 3
% Vigenere Cipher 
% Version 1.0
% Author: Carro, M.A. et al.
% Date: October 13, 2016

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

% ------------------------------------------------------------------------------

% SUMMARY OF ALGORITHM 

% This algorithm consists of a 'main' script, vinegerex.m, and operates onto
% four functions, namely vcipher, encrypt, vdecipher, and decrypt to produce a
% ciphertext enciphered via the use of Vigenere's algorithm (Vinegere cipher). 
% It prompts the user for a plaintext and a key, and proceeds to map plaintext's 
% and key's literals to the numeral space (i.e. to equivalences 1 to 26). 
% Functions vcipher and encrypt operate bivariatly on plaintext and key to yield
% the ciphertext. The program then displays encoding into ciphertext of said 
% plaintext, as a function of the key. To prove its reconstruction, program then
% operates functions vdecipher and decrypt on ciphertext and key to display
% reproduction of plaintext.  

% ERRORS: For this particular implementation, there seems to exist certain 
% combinations of ciphertext/key for which the decryption mechanism either 
% yields an aliased reconstruction of the plaintext, or from which no decryption
% throughtputs at all. We hypothesise nature of this error having to do either 
% with the digrams used to represent spaces in the plaintext and/or with some 
% indexes of decipherment mapping to zero (as a result of the '-1' perhaps; or 
% maybe of not making proper use of the formality pi = (Ci - ki_mod_m) along 
% the formulae?) thus yielding indexation-incompatibility in MATLAB (octave) 
% consequential to the structure of the language indexing for integers greater
% than or equal to one. For example, if for a given p(i) and k(i), the statement 
% k(i) = find(key(i) == alphabet) equals one (1), minus one (1) = 0, truncating
% outputs yielding from such index thereof. After some debugging efforts, it 
% was not possible to yet correct this anomaly (plaintext "antl nvy hos two mi 
% sw tjvq undr atoll req fxtrt azulu" for keys tried (e.g. "puertorrican navy")
% and for several "impossible" digrams tested (see 'impdgrams.txt') seemed to 
% always give an error on decryption. Is there some limit on the minimum 
% average size of the words in the plaintext that would yield for the Vinegere
% cipher an impossibility of reconstruction (analogous to the sampling theorem, 
% for instance)? Or is it a mere consequence of the unsophistication herein of
% the algorithm as implemented? It's reflected upon the answer might underlie 
% modular arithmetic.              


% ------------------------------------------------------------------------------ 

%clean

disp('Disclamer: This implementation of the Vigenere cipher is intended for educational purposes only. It should not be used to encipher sensitive information in any way, shape, or form.')
disp('Licence: This application (the Software) is provided "as is" without guarantees and with all rights, privileges, and obligations thereunto granted by the MIT License. See source for more information.')  
prompt = 'Press any key to continue.';
str = input(prompt,'s');
if isempty(str)
    str = '';
end

% Only English language characters allowed. No numbers or special characters allowed for now. 

% Generate the (English) alphabet:
alphabet = ['a':'z'];

% Define space digram:
% sdig = 'xj'; % error on decryption 

prompt2 = 'Please enter the plaintext (e.g. antl nvy hos two mi sw tjvq undr atoll req fxtrt azulu):';
plaintext = input(prompt2,'s');
% plaintext = plaintext(find(~isspace(plaintext))); 
plaintext = strrep(plaintext,' ','qp');   

prompt3 = 'Please enter the key:';
key = input(prompt3, 's');
key = key(find(~isspace(key))); 

disp('Ciphertext:')
ciphertext = vcipher(plaintext, key);
disp(ciphertext)

disp('Proof of Encipherment (synthesis of the plaintext):')
rplaintext = vdecipher(ciphertext, key);
disp(strrep(rplaintext,'qp',' '))
