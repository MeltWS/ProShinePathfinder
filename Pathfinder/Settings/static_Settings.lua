-- STATIC SETTINGS

local ss = {}

-- 1 if you do not care about money issue 999 if you never want to take these --
 
ss.K_SUBWAY = 10 -- Weight for using the subway path. Kanto
ss.J_SUBWAY = 10 -- Weight for using the subway path. Johto
ss.H_SUBWAY = 10 -- Weight for using the subway path. Hoenn

ss.J_TO_K   = 10 -- Weight of the Subway from Johto to Kanto and reverse.
ss.H_TO_KJ  = 10 -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.

return ss
