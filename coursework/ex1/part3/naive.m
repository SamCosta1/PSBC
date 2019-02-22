function n = naive(N)   best = 11826; bestdiff = abs(N-best^2); for i = 11826:30384    if isPerfect(i^2) && abs(i^2 - N) <= bestdiff      best = i;      bestdiff = abs(i^2 - N);    endif  endfor  n = best;
endfunction
