%using switch to calculate the xuefen;
clear
n=input(' ‰»Î n=');
switch fix(n/10)
    case{10,9}
        r='A'
    case 8
        r='B'
    case 7
        r='C'
    case 6
        r='D'
    otherwise
        r='E'
end