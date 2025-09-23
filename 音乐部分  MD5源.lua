-- MD5 音乐-分源  A1-7
-- 哈希值运算法  32小-16进-字符
print(md5("XGOHUB"))
-- 输出结果：5b2b9d6e8d449b0c84e6f0d6f4e7c8a9
-- 获取32位小写md5值 --待修复

local function md5(s)
    local k = {0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0}
    local function rotateLeft(a, b) return bit32.lrotate(a, b) end
    local function toHex(v)
        local s = ""
        for i = 1, 4 do s = string.format("%02x", bit32.extract(v, (i - 1) * 8, 8)) .. s end
        return s
    end
    local function processChunk(chunk)
        local w = {}
        for i = 0, 15 do w[i] = string.unpack(">I4", chunk:sub(i * 4 + 1, i * 4 + 4)) end
        for i = 16, 79 do w[i] = bit32.lrotate(w[i - 3] ~ w[i - 8] ~ w[i - 14] ~ w[i - 16], 1) end
        local a, b, c, d, e = k[1], k[2], k[3], k[4], k[5]
        for i = 0, 79 do
            local f, t
            if i < 20 then
                f = (b & c) | (~b & d)
                t = 0x5A827999
            elseif i < 40 then
                f = b ~ c ~ d
                t = 0x6ED9EBA1
            elseif i < 60 then
                f = (b & c) | (b & d) | (c & d)
                t = 0x8F1BBCDC
            else
                f = b ~ c ~ d
                t = 0xCA62C1D6
            end
            local temp = (rotateLeft(a, 5) + f + e + t + w[i]) & 0xFFFFFFFF
            e, d, c, b, a = d, c, rotateLeft(b, 30), a, temp
        end
        k[1] = (k[1] + a) & 0xFFFFFFFF
        k[2] = (k[2] + b) & 0xFFFFFFFF
        k[3] = (k[3] + c) & 0xFFFFFFFF
        k[4] = (k[4] + d) & 0xFFFFFFFF
        k[5] = (k[5] + e) & 0xFFFFFFFF
    end
    local msg = s .. string.char(0x80)
    local pad = 64 - ((#msg + 8) % 64)
    if pad ~= 64 then msg = msg .. string.rep("\0", pad) end
    msg = msg .. string.pack(">I8", #s * 8)
    for i = 1, #msg, 64 do processChunk(msg:sub(i, i + 63)) end
    return toHex(k[1]) .. toHex(k[2]) .. toHex(k[3]) .. toHex(k[4]) .. toHex(k[5])
end
