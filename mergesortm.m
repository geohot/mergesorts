%%
function mergesortm

a = [5 9 1 3 4 6 6 3 2];
disp(msort(a))

end

%%
function [out] = msort(a)

if (length(a) == 1)
    out = a; return
elseif (length(a) == 2)
    if (a(1) > a(2))
        out = [a(2) a(1)]; return
    else
        out = a; return
    end
end

p = round(length(a)/2);
m1 = msort(a(1:p));
m2 = msort(a(p+1:end));

out = zeros(size(a));
idx = 1;
while (~isempty(m1) || ~isempty(m2))
    if (~isempty(m1) && ~isempty(m2) && (m1(1) <= m2(1)))
        out(idx) = m1(1); m1 = m1(2:end);
    elseif (~isempty(m1) && ~isempty(m2) && (m1(1) > m2(1)))
        out(idx) = m2(1); m2 = m2(2:end);
    elseif (~isempty(m1))
        out(1:idx+length(m1)-1) = [out(1:idx-1) m1]; m1 = [];
    elseif (~isempty(m2))
        out(1:idx+length(m2)-1) = [out(1:idx-1) m2]; m2 = [];
    end
    idx = idx + 1;
end

end