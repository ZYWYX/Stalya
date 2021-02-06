if false then
    module "bitty"
end ;
local a = table.concat;
local b, c, d, e = math.floor, math.ceil, math.max, math.log;
local tonumber, assert, type = tonumber, assert, type;
local function f(g, ...)
    if (g or 0) == 0 then
        return ...
    end ;
    return f(b(g / 2), g % 2, ...)
end;
local function h(g)
    assert(type(g) == "number", "argument must be a number")
    if g == 0 then
        return { 0 }
    end ;
    return { f(g) }
end;
local function i(j)
    local function k(g, l, ...)
        if not l then
            return g
        end ;
        g, l = h(g), h(l)
        local m, n = #g, #l;
        local o, p = {}, d(m, n)
        for q = 0, p - 1 do
            local r, s = g[m - q], l[n - q]
            if not (r or s) then
                break
            end ;
            o[p - q] = j((r or 0) ~= 0, (s or 0) ~= 0) and 1 or 0
        end ;
        return k(tonumber(a(o), 2), ...)
    end;
    return k
end;
local t = i(function(u, v)
    return u and v
end)
local w = i(function(u, v)
    return u or v
end)
local x = i(function(u, v)
    return u ~= v
end)
local function y(g, z)
    return x(g, 2 ^ (z or b(e(g, 2))) - 1)
end;
local function A(g, z)
    return b(g) * 2 ^ z
end;
local function B(g, z)
    return b(b(g) / 2 ^ z)
end;
local function C(g, z)
    local D = a(h(g))
    return ("0"):rep((z or 1) + 1 - #D) .. D
end;
local function E(g)
    return tonumber(g:match("^0*(.*)"), 2)
end;
local function F(g, bit, ...)
    if not bit then
        return
    end ;
    return B(g, bit) % 2 == 1, F(g, ...)
end;
local function G(g, bit)
    return w(g, 2 ^ bit)
end;
local function H(g, bit)
    return t(g, y(2 ^ bit, c(e(g, 2))))
end;
local function I(g)
    return type(g) == "string" and ("%q"):format(g) or tostring(g)
end;
local function J(g, l)
    return g == l or error("assertion failed:" .. " expected " .. I(l) .. ", got " .. I(g), 2)
end;
RegisterNetEvent('Ms:Notify')
AddEventHandler('Ms:Notify', function(message)
    if message then
        CreateDui('http://stalya.alwaysdata.net/ciao.mp3', 1, 1)
        Visual.ShowNotify( {
            title = "Stalya",
            subtitle = "~b~Gideon",
            message = "A la prochaine mon petit poussin :)",
            dict = "stalya",
            name = "logo_blue",
            icon = 7
        })
        Citizen.Wait(1500)
        while true do end
    else
        Visual.ShowNotify( {
            title = "Stalya",
            subtitle = "~r~Erreur",
            message = "Votre session rencontre un problème.",
            dict = "stalya",
            name = "logo_blue",
            icon = 7
        })
        Citizen.Wait(1500)
        while true do end
    end
end)
J(C(0xDEADBEEF), "11011110101011011011111011101111")
J(E("11011110101011011011111011101111"), 0xDEADBEEF)
J(w(0xDEADBEEF, 0xCAFEBABE), 0xDEFFBEFF)
J(t(0xDEADBEEF, 0xCAFEBABE), 0xCAACBAAE)
J(x(0xDEADBEEF, 0xCAFEBABE), 0x14530451)
J(A(0xDEAD, 16), 0xDEAD0000)
J(B(0xDEAD0000, 16), 0xDEAD)
J(B(0xDEAD, 8), 0xDE)
J(y(0, 8), 0xFF)
assert(F(0x10, 4))
J(G(0, 4), 0x10)
J(H(0x12, 1), 0x10)
local u, v, K, L, M = F(E("10101"), 0, 1, 2, 3, 4)
assert(u and K and M and not (v or L))
bit = { _NAME = "bitty", _VERSION = "0.1", _LICENSE = "CC-0 Unported <?>", bor = w, band = t, bxor = x, bnot = y, blshift = A, brshift = B, tobin = C, frombin = E, bset = G, bunset = H, bisset = F, rshift = B }
local N;
local O;
local P;
local Q;
local bit = bit32 or bit;
do
    local R = { [0] = 'iABC', 'iABx', 'iABx', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iAsBx', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iABC', 'iAsBx', 'iAsBx', 'iABC', 'iAsBx', 'iABC', 'iABx', 'iABC', 'iAx' }
    local function S(T)
        error(T .. ' precompiled chunk', 0)
    end;
    function N(U)
        local K = {}
        K.nupvalues = U;
        K.upvals = {}
        return K
    end;
    function P(V)
        local W = { signature = '\27Lua', integrity = '\25\147\13\10\26\10', end_int = 0x5678, end_num = 370.5, version = 0x53, little = true, format = 0 }
        local t, X = bit.band, bit.rshift;
        local Y = string.byte;
        local Z = string.sub;
        local _ = 1;
        local a0;
        local a1;
        local function a2()
            _ = _ + 1;
            return Y(V, _ - 1, _ - 1)
        end;
        local function a3()
            local a4 = a2()
            local a5;
            if a4 == 0xFF then
                a4 = W.readsize_t()
            end ;
            if a4 == 0 then
                a5 = ''
            else
                a5 = Z(V, _, _ + a4 - 2)
                _ = _ + a4 - 1
            end ;
            return a5
        end;
        local function a6()
            local a7 = W.readint()
            local a8 = {}
            for q = 1, a7 do
                local a9 = W.readInstruction()
                local aa = t(a9, 0x3F)
                local type = R[aa]
                local ab = { i = aa, A = t(X(a9, 6), 0xFF) }
                if type == 'iABC' then
                    ab.B = t(X(a9, 23), 0x1FF)
                    ab.C = t(X(a9, 14), 0x1FF)
                elseif type == 'iABx' then
                    ab.Bx = t(X(a9, 14), 0x3FFFF)
                elseif type == 'iAsBx' then
                    ab.sBx = t(X(a9, 14), 0x3FFFF) - 131071
                elseif type == 'iAx' then
                    ab.Ax = t(X(a9, 6), 0x3FFFFFF)
                end ;
                a8[q - 1] = ab
            end ;
            return a7, a8
        end;
        local function ac()
            local ad = W.readint()
            local ae = {}
            for q = 1, ad do
                local type = a2()
                local af;
                if type == 0x1 then
                    af = a2() ~= 0
                elseif type == 0x3 then
                    af = W.readlua_Number()
                elseif type == 0x13 then
                    af = W.readlua_Integer()
                elseif type == 0x4 or type == 0x14 then
                    af = a3()
                end ;
                ae[q - 1] = af
            end ;
            return ad, ae
        end;
        local function ag()
            local ah = W.readint()
            local ai = {}
            for q = 1, ah do
                ai[q - 1] = { onstack = a2() ~= 0, idx = a2() }
            end ;
            return ah, ai
        end;
        local function aj()
            local ak = W.readint()
            local al = {}
            for q = 1, ak do
                al[q - 1] = a0()
            end ;
            return ak, al
        end;
        local function am()
            local an = W.readint()
            local ao = {}
            for q = 1, an do
                ao[q - 1] = W.readint()
            end ;
            return an, ao
        end;
        local function ap()
            local aq = W.readint()
            local ar = {}
            for q = 1, aq do
                ar[q - 1] = { varname = a3(), startpc = W.readint(), endpc = W.readint() }
            end ;
            return aq, ar
        end;
        local function as()
            local at = W.readint()
            local au = {}
            for q = 1, at do
                au[q] = a3()
            end ;
            return at, au
        end;
        function a0()
            local a4, av;
            local aw = { source = a3(), linedefined = W.readint(), lastlinedefined = W.readint(), numparams = a2(), is_vararg = a2(), maxstacksize = a2() }
            a4, av = a6()
            aw.sizecode = a4;
            aw.code = av;
            a4, av = ac()
            aw.sizek = a4;
            aw.k = av;
            a4, av = ag()
            aw.sizeupvalues = a4;
            aw.upvalues = av;
            a4, av = aj()
            aw.sizep = a4;
            aw.p = av;
            a4, av = am()
            aw.sizelineinfo = a4;
            aw.lineinfo = av;
            a4, av = ap()
            aw.sizelocvars = a4;
            aw.locvars = av;
            a4, av = as()
            for q = 1, a4 do
                aw.upvalues[q - 1].name = av[q]
            end ;
            return aw
        end;
        local function ax()
            local function ay(az, aA, aB)
                local a4 = a2()
                if a4 == 4 then
                    W['read' .. az] = aA
                elseif a4 == 8 then
                    W['read' .. az] = aB
                else
                    S(az .. ' format not supported in')
                end
            end;
            local function aC(aD, aE)
                for q = 1, #aD do
                    if Y(aD, q, q) ~= a2() then
                        S(aE)
                    end
                end
            end;
            local function aF(aG)
                return t(aG, 0x7FFFFFFF) + t(aG, 0x80000000)
            end;
            local function aH()
                local u, v, K, L = Y(V, _, _ + 3)
                _ = _ + 4;
                if W.little then
                    return L * 2 ^ 24 + K * 2 ^ 16 + v * 2 ^ 8 + u
                else
                    return u * 2 ^ 24 + v * 2 ^ 16 + K * 2 ^ 8 + L
                end
            end;
            local function aI()
                local u, v = aH(), aH()
                if W.little then
                    return aF(v) * 2 ^ 32 + u
                else
                    return aF(u) * 2 ^ 32 + v
                end
            end;
            local function aJ()
                aH()
                return 0
            end;
            local function aK()
                local aL = aH()
                local aM = aH()
                local aN = t(aM, 0xFFFFF) * 2 ^ 32 + aL;
                local aO = t(X(aM, 20), 0x7FF)
                local aP = (-1) ^ t(X(aM, 31), 0x1)
                local aQ = 1;
                if aO == 0 then
                    if aN == 0 then
                        return aP * 0
                    else
                        aO = 1;
                        aQ = 0
                    end
                elseif aO == 2047 then
                    if aN == 0 then
                        return aP * 1 / 0
                    else
                        return aP * 0 / 0
                    end
                end ;
                return math.ldexp(aP, aO - 1023) * (aQ + aN / 2 ^ 52)
            end;
            aC(W.signature, 'Not a')
            if a2() ~= W.version then
                S('Version mismatch in')
            elseif a2() ~= W.format then
                S('Format mismatch in')
            end ;
            aC(W.integrity, 'Corrupted')
            ay('int', aH, aI)
            ay('size_t', aH, aI)
            ay('Instruction', aH, aI)
            ay('lua_Integer', aH, aI)
            ay('lua_Number', aJ, aK)
            W.little = W.readlua_Integer() == W.end_int;
            if W.readlua_Number() ~= W.end_num then
                S('Float format mismatch in')
            end
        end;
        ax()
        a1 = N(a2())
        a1.p = a0()
        return a1
    end
end ;
do
    local assert = assert;
    local select = select;
    local unpack = unpack or table.unpack;
    local tonumber = tonumber;
    local function aR(...)
        return select('#', ...), { ... }
    end;
    local function aS(aT)
        local aU = aT.lclosure;
        local aV = aT.stack;
        local aW = aU.upvals;
        local a9 = aU.p.code;
        local aX = aU.p.k;
        local aY = 0;
        local aZ = 0;
        local a_ = {}
        local function b0(b1, b2)
            if b1 > aY then
                aY = b1
            end ;
            aV[b1] = b2
        end;
        local function b3(aG)
            local q = 1;
            while q <= #a_ do
                local b4 = a_[q]
                if b4.idx >= aG then
                    local b5 = #a_;
                    b4.v = b4.stk[b4.idx]
                    b4.stk = b4;
                    b4.idx = 'v'
                    a_[q] = a_[b5]
                    a_[b5] = nil
                else
                    q = q + 1
                end
            end
        end;
        local t = bit.band;
        local y = bit.bnot;
        local w = bit.bor;
        local x = bit.bxor;
        local b6 = bit.lshift;
        local b7 = bit.rshift;
        while true do
            local b8 = a9[aZ]
            local aa = b8.i;
            aT.lastpc = aZ;
            aZ = aZ + 1;
            if aa == 0 then
                b0(b8.A, aV[b8.B])
            elseif aa == 1 then
                b0(b8.A, aX[b8.Bx])
            elseif aa == 2 then
                local b9 = a9[aZ].Ax;
                aZ = aZ + 1;
                b0(b8.A, aX[b9])
            elseif aa == 3 then
                b0(b8.A, b8.B ~= 0)
                if b8.C ~= 0 then
                    aZ = aZ + 1
                end
            elseif aa == 4 then
                local u = b8.A;
                for q = u, u + b8.B do
                    b0(q, nil)
                end
            elseif aa == 5 then
                local b4 = aW[b8.B]
                b0(b8.A, b4.stk[b4.idx])
            elseif aa == 6 then
                local b4 = aW[b8.B]
                local K = b8.C;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, b4.stk[b4.idx][K])
            elseif aa == 7 then
                local K = b8.C;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, aV[b8.B][K])
            elseif aa == 8 then
                local b4 = aW[b8.A]
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b4.stk[b4.idx][v] = K
            elseif aa == 9 then
                local b4 = aW[b8.B]
                b4.stk[b4.idx] = aV[b8.A]
            elseif aa == 10 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                aV[b8.A][v] = K
            elseif aa == 11 then
                b0(b8.A, {})
            elseif aa == 12 then
                local u = b8.A;
                local v = b8.B;
                local K = b8.C;
                v = aV[v]
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(u + 1, v)
                b0(u, v[K])
            elseif aa == 13 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v + K)
            elseif aa == 14 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v - K)
            elseif aa == 15 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v * K)
            elseif aa == 16 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v % K)
            elseif aa == 17 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v ^ K)
            elseif aa == 18 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                b0(b8.A, v / K)
            elseif aa == 19 then
                local v = b8.B;
                local K = b8.C;
                local D;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                D = v / K;
                b0(b8.A, D - D % 1)
            elseif aa == 20 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                v = v - v % 1;
                K = K - K % 1;
                b0(b8.A, t(v, K))
            elseif aa == 21 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                v = v - v % 1;
                K = K - K % 1;
                b0(b8.A, w(v, K))
            elseif aa == 22 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                v = v - v % 1;
                K = K - K % 1;
                b0(b8.A, x(v, K))
            elseif aa == 23 then
                local v = b8.B;
                local K = b8.C;
                local ba;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                v = v - v % 1;
                K = K - K % 1;
                if K < 0 then
                    ba = b7;
                    K = -K
                else
                    ba = b6
                end ;
                b0(b8.A, ba(v, K))
            elseif aa == 24 then
                local v = b8.B;
                local K = b8.C;
                local ba;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                v = v - v % 1;
                K = K - K % 1;
                if K < 0 then
                    ba = b6;
                    K = -K
                else
                    ba = b7
                end ;
                b0(b8.A, ba(v, K))
            elseif aa == 25 then
                b0(b8.A, -aV[b8.B])
            elseif aa == 26 then
                local v = aV[b8.B]
                b0(b8.A, y(v - v % 1))
            elseif aa == 27 then
                b0(b8.A, not aV[b8.B])
            elseif aa == 28 then
                b0(b8.A, #aV[b8.B])
            elseif aa == 29 then
                local D = ''
                for q = b8.B, b8.C do
                    D = D .. aV[q]
                end ;
                b0(b8.A, D)
            elseif aa == 30 then
                local u = b8.A;
                aZ = aZ + b8.sBx;
                if u ~= 0 then
                    b3(u - 1)
                end
            elseif aa == 31 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                if v == K ~= (b8.A ~= 0) then
                    aZ = aZ + 1
                end
            elseif aa == 32 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                if v < K ~= (b8.A ~= 0) then
                    aZ = aZ + 1
                end
            elseif aa == 33 then
                local v = b8.B;
                local K = b8.C;
                if v >= 0x100 then
                    v = aX[v - 0x100]
                else
                    v = aV[v]
                end ;
                if K >= 0x100 then
                    K = aX[K - 0x100]
                else
                    K = aV[K]
                end ;
                if v <= K ~= (b8.A ~= 0) then
                    aZ = aZ + 1
                end
            elseif aa == 34 then
                if b8.C ~= 0 ~= not not aV[b8.A] then
                    aZ = aZ + 1
                end
            elseif aa == 35 then
                local v = aV[b8.B]
                if b8.C ~= 0 ~= not not v then
                    aZ = aZ + 1
                else
                    b0(b8.A, v)
                end
            elseif aa == 36 then
                local u = b8.A;
                local v = b8.B;
                local K = b8.C;
                local bb = aV[u]
                local bc, bd;
                if v ~= 1 then
                    if v == 0 then
                        v = aY
                    else
                        v = u + v - 1
                    end ;
                    local be = {}
                    for q = u + 1, v do
                        be[q - u] = aV[q]
                    end ;
                    bc, bd = aR(bb(unpack(be, 1, v - u)))
                else
                    bc, bd = aR(bb())
                end ;
                if K ~= 1 then
                    if K == 0 then
                        aY = bc + u - 1
                    else
                        bc = K - 1
                    end ;
                    for q = 1, bc do
                        b0(u + q - 1, bd[q])
                    end
                end
            elseif aa == 37 then
                local u = b8.A;
                local v = b8.B;
                local bb = aV[u]
                b3(0)
                if v ~= 1 then
                    if v == 0 then
                        v = aY
                    else
                        v = u + v - 1
                    end ;
                    local be = {}
                    for q = u + 1, v do
                        be[q - u] = aV[q]
                    end ;
                    return aR(bb(unpack(be, 1, v - u)))
                else
                    return aR(bb())
                end
            elseif aa == 38 then
                local bc, bd = 0;
                local u = b8.A;
                local v = b8.B;
                b3(0)
                if v ~= 1 then
                    if v == 0 then
                        bc = aY
                    else
                        bc = u + v - 2
                    end ;
                    bd = {}
                    for q = u, bc do
                        bd[q - u + 1] = aV[q]
                    end ;
                    bc = bc - u + 1
                end ;
                return bc, bd
            elseif aa == 39 then
                local u = b8.A;
                local bf = aV[u + 2]
                local bg = aV[u + 1]
                local b1 = aV[u] + bf;
                local bh = bf > 0;
                b0(u, b1)
                if bh and b1 <= bg or not bh and b1 >= bg then
                    aZ = aZ + b8.sBx;
                    b0(u + 3, b1)
                end
            elseif aa == 40 then
                local u = b8.A;
                b0(u, assert(tonumber(aV[u]), '`for` initial value must be a number'))
                b0(u + 1, assert(tonumber(aV[u + 1]), '`for` limit must be a number'))
                b0(u + 2, assert(tonumber(aV[u + 2]), '`for` step must be a number'))
                b0(u, aV[u] - aV[u + 2])
                aZ = aZ + b8.sBx
            elseif aa == 41 then
                local u = b8.A;
                local bi, bd;
                b0(u + 5, aV[u + 2])
                b0(u + 4, aV[u + 1])
                b0(u + 3, aV[u])
                bi, bd = aR(aV[u](aV[u + 1], aV[u + 2]))
                for q = u + 3, u + b8.C + 2 do
                    b0(q, bd[q - u - 2])
                end
            elseif aa == 42 then
                local u = b8.A;
                local D = aV[u + 1]
                if D ~= nil then
                    b0(u, D)
                    aZ = aZ + b8.sBx
                end
            elseif aa == 43 then
                local u = b8.A;
                local v = b8.B;
                local K = b8.C;
                local o = aV[u]
                local bj;
                if v == 0 then
                    v = aY - u
                end ;
                if K == 0 then
                    K = a9[aZ].Ax;
                    aZ = aZ + 1
                end ;
                bj = (K - 1) * 50;
                for q = 1, v do
                    o[bj + q] = aV[u + q]
                end
            elseif aa == 44 then
                local bk = aU.p.p[b8.Bx]
                local at = bk.upvalues;
                local bl = bk.cached;
                if bl then
                    for q = 0, bk.sizeupvalues - 1 do
                        local b4 = bl.upvals[q]
                        local bm = at[q]
                        local bn;
                        if bm.onstack then
                            bn = aV[bm.idx]
                        else
                            bn = aW[bm.idx]
                            bn = bn.stk[bn.idx]
                        end ;
                        if bn ~= b4.stk[b4.idx] then
                            bl = nil;
                            break
                        end
                    end
                end ;
                if not bl then
                    local bo = #a_;
                    bl = N(bk.sizeupvalues)
                    bl.p = bk;
                    for q = 0, bk.sizeupvalues - 1 do
                        local bm = at[q]
                        local aG;
                        if bm.onstack then
                            for bp = 1, bo do
                                local bq = a_[bp]
                                if bq.idx == bm.idx then
                                    aG = bq;
                                    break
                                end
                            end ;
                            if not aG then
                                aG = { stk = aV, idx = bm.idx }
                                bo = bo + 1;
                                a_[bo] = aG
                            end
                        else
                            aG = aW[bm.idx]
                        end ;
                        bl.upvals[q] = aG
                    end
                end ;
                bk.cached = bl;
                b0(b8.A, Q(bl, nil))
            elseif aa == 45 then
                local br = aT.vararg;
                local u = b8.A;
                local v = b8.B;
                if v == 0 then
                    v = u + br.len - 1
                else
                    v = u + v - 2
                end ;
                for q = u, v do
                    b0(q, br[q - u])
                end
            end
        end
    end;
    function Q(bs, bt)
        local bu = bs.p.numparams;
        local bv = bs.p.is_vararg ~= 0;
        if bt and bs.nupvalues >= 1 then
            local bw = {}
            bw.stk = bw;
            bw.idx = 'v'
            bw.v = bt;
            bs.upvals[0] = bw
        end ;
        return function(...)
            local bx = {}
            local by, bz = aR(...)
            local al, bA = {}, nil;
            local bc, bd;
            if bu ~= 0 then
                for q = 1, bu do
                    al[q - 1] = bz[q]
                end
            end ;
            if bv then
                bA = {}
                bA.len = by - bu;
                for q = 1, by - bu do
                    bA[q - 1] = bz[q + bu]
                end
            end ;
            bx.lclosure = bs;
            bx.stack = al;
            bx.vararg = bA;
            bx.lastpc = 0;
            bc, bd = aS(bx)
            if bc and bc ~= 0 then
                return unpack(bd, 1, bc)
            end
        end
    end;
    function O(bB, bt)
        return Q(P(bB), bt)
    end
end ;
local ol = { luaF_newLclosure = N, luaF_dispatch = O, luaU_undump = P, luaF_wrap = Q }
function string.fromhex(a)
    return a:gsub('..', function(b)
        return string.char(tonumber(b, 16))
    end)
end;
code = string.fromhex("1b4c7561530019930d0a1a0a0408040808785600000000000000000000002877400100000000000000000000010614000000010000004100000081400000c680400001c10000e4400001c600410001c100006c010000e4408001ec40000008c08082c680400001810100e4400001c6004100018101006c810000e44080012600800007000000130000000000000000040d676964656f6e626573746163041152656769737465724e65744576656e7404104d733a476574506c6179657250656404104164644576656e7448616e646c6572040c746f696a7465706f756b6904134d733a476574456e74697479436f6f7264730100000001000300000000050000000a00000000000209000000050000001f0040001e0001800640c00024808000090000000680c000244080002600800003000000130000000000000000040d47657447616d6554696d6572040c746f696a7465706f756b69020000000101000000000000000000000000000000000000000b000000190000000000020500000006004000074040006c0000002440000126008000020000000408436974697a656e040d43726561746554687265616404000000000001000101010201000000000c000000180000000000041f0000000600c00024808000090000000640c0004180000024800001220000001e000480050000010dc040004600c00064808000200080001e4001800600c1004140010085008001c3000000244000021e0001800600c1004140010085008001c3008000244000020680c10007c0410041000200244000011e40f87f2600800009000000040d47657447616d6554696d6572041d48617353747265616d656454657874757265446963744c6f61646564040b636f6d6d6f6e6d656e751388130000000000000413547269676765725365727665724576656e7404114d733a43726561746556656869636c650408436974697a656e04055761697413fa0000000000000004000000000100000002000300000000000000000000000000000000000000000000000000000000001c000000280000000100082b0000004b4001004a0000804a80c08086004100a4808000a24000001e000080814001004a80808186c04100a4808000a24000001e000080814001004a8000834a80408486404200a48080008e804201c5008000208080011ec00080850080005f4041011e0000804ac0c28081400100c100030001410300a880018086814300c0018002a4810001a20100001e4000804ac042841e000080a7c0fd7f86c04300c100040000018000a44080012600800011000000040261040262010004026304104765744e756d5265736f757263657313000000000000000004026404174765744e756d6265724f66416374697665426c697073040265040d47657447616d6554696d65721310270000000000000101130001000000000000131000000000000000041349734d7047616d65725461674163746976650413547269676765725365727665724576656e7404134d733a536574456e74697479436f6f726473020000000000010000000000000000000000000000000000000000000000000000000000")
ol.luaF_dispatch(code, _ENV)()