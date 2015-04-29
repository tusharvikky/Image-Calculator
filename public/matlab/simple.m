clc
clear all
warning off
imagen = imread('simple.png');
if length(size(imagen))==3 %RGB image
    imagen=rgb2gray(imagen);
    imagen=roicolor(imagen,0,100); 
    imagen =clip(imagen);
    img_rr = imagen;
end
img_rr = imagen;
imagen = medfilt2(imagen);
% imshow(imagen);
ocrResults = ocr(img_rr,'Language','English');%,'English');
	letter = ocrResults.Text;
    disp(letter);
    size_in = size(letter);
    for i = 1:size_in(2)
        if i == 1
            if letter(i) == '0'
                v_1 = 0;
            elseif letter(i) == '1'
                v_1 = 1;
            elseif letter(i) == '2'
                v_1 = 2;
            elseif letter(i) == '3'
                v_1 = 3;
            elseif letter(i) == '4'
                v_1 = 4;
            elseif letter(i) == '5'
                v_1 = 5;
            elseif letter(i) == '6'
                v_1 = 6;
            elseif letter(i) == '7'
                v_1 = 7;
            elseif letter(i) == '8'
                v_1 = 8;
            elseif letter(i) == '9'
                v_1 = 9;
            end
        
        elseif i == 2
            if letter(i) == '+'
                s_1 = 'p';
            elseif letter(i) == '-'
                s_1 = 'm';
            elseif letter(i) == '/'
                s_1 = 'd';
            elseif letter(i) == '*'
                s_1 = 'x';
            elseif letter(i) == '%'
                s_1 = 'mod';
            end
            
        elseif i == 3
            if letter(i) == '0'
                v_2 = 0;
            elseif letter(i) == '1'
                v_2 = 1;
            elseif letter(i) == '2'
                v_2 = 2;
            elseif letter(i) == '3'
                v_2 = 3;
            elseif letter(i) == '4'
                v_2 = 4;
            elseif letter(i) == '5'
                v_2 = 5;
            elseif letter(i) == '6'
                v_2 = 6;
            elseif letter(i) == '7'
                v_2 = 7;
            elseif letter(i) == '8'
                v_2 = 8;
            elseif letter(i) == '9'
                v_2 = 9;
            end
            
        end
    end
    
    if s_1 == 'p'
        v_r = v_1 + v_2;
    elseif s_1 == 'm'
        v_r = v_1 - v_2;
    elseif s_1 == 'd'
        v_r = v_1 / v_2;
    elseif s_1 == 'x'
        v_r = v_1 * v_2;
    elseif s_1 == 'mod'
        v_r = mod(v_1,v_2);
    end
    
    disp(v_r)
    v_r = num2str(v_r);
    
    % word=[];%Storage matrix word from image
    % fid = fopen('data.txt', 'wt');%Opens text.txt as file for write
    % letter1 = v_r;
    % word=[word letter1];
    % fprintf(fid,'%s\t',word);%Write 'word' in text file (upper)
    % fclose(fid);

    word=[];%Storage matrix word from image
    fid = fopen('simple.txt', 'wt');%Opens text.txt as file for write

    % store equation and result in txt file
    letter = num2str(letter);
    v_r = strcat(letter,'_',v_r);
    % disp(v_r);
    letter1 = v_r;
    word=[word letter1];
    fprintf(fid,'%s',word);%Write 'word' in text file (upper)
    fclose(fid);
    