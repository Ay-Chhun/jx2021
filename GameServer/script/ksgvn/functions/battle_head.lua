
CONGTRANG_LOIHO_TUONG = 640000
CONGTRANG_LOIHO_SOAI = 960000

CONGTRANG_HOAPHUNG_TUONG = 1600000
CONGTRANG_HOAPHUNG_SOAI = 4800000

CONGTRANG_THANHLONG_TUONG = 3200000
CONGTRANG_THANHLONG_SOAI = 6400000

CONGTRANG_UYHO_TUONG = 5600000
CONGTRANG_UYHO_SOAI = 8800000

CONGTRANG_HANVU_TUONG = 9800000
CONGTRANG_HANVU_SOAI = 12100000


CONGTRANG_HANVU_TUONG = 9600000
CONGTRANG_HANVU_SOAI = 12800000


TONGLIEU_LIMIT_FILENAME = 'tonglieu_limit.txt'

TONGLIEU_MAX_PLAYER_SIGNUP = 3
TONGLIEU_LIMIT_OPEN  = 0

ALL_ID = 0
SONG_ID = 1
LIAO_ID = 2

g_tbBattleEquip = {
    [SONG_ID] = {
        -- Thunder Tiger General
        [1] = {
            tbRange = {
                { 30215, 30218 },
            },
            szName = "Thunder Tiger General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_LOIHO_TUONG,
        },
        [2] = {
            tbRange = {
                { 30157, 30168 },
            },
            szName = "Thunder Tiger General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_LOIHO_TUONG,
        },
        -- Thunder Tiger Marshal
        [3] = {
            tbRange = {
                { 30219, 30222 },
            },
            szName = "Thunder Tiger Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_LOIHO_SOAI,
        },
        [4] = {
            tbRange = {
                { 30169, 30184 },
            },
            szName = "Thunder Tiger Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_LOIHO_SOAI,
        },
        --Fire Phoenix General
        [5] = {
            tbRange = {
                { 30311, 30374 },
                { 32153, 32153 },
                { 32161, 32161 },
            },
            szName = "Fire Phoenix General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        [6] = {
            tbRange = {
                { 30228, 30419 },
                { 31486, 31488 },
                { 31514, 31516 },
            },
            szName = "Fire Phoenix General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        [7] = {
            tbRange = {
                { 30288, 30391 },
                { 32165, 32167 },
                { 32193, 32195 },
            },
            szName = "Fire Phoenix General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        --Fire Phoenix Marshal
        [8] = {
            tbRange = {
                { 30375, 30438 },
                { 32154, 32154 },
                { 32162, 32162 },
            },
            szName = "Fire Phoenix Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        [9] = {
            tbRange = {
                { 30420, 30675 },
                { 31489, 31492 },
                { 31517, 31520 },
            },
            szName = "Fire Phoenix Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        [10] = {
            tbRange = {
                { 30392, 30495 },
                { 32168, 32170 },
                { 32196, 32198 },
            },
            szName = "Fire Phoenix Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        --Azure Dragon General
        [11] = {
            tbRange = {
                { 30570, 30589 },
                { 32157, 32157 },
                { 32165, 32165 },
            },
            szName = "Azure Dragon General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        [12] = {
            tbRange = {
                { 31132, 31191 },
                { 31493, 31495 },
                { 31521, 31523 },
            },
            szName = "Azure Dragon General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        [13] = {
            tbRange = {
                { 30764, 30823 },
                { 32171, 32173 },
                { 32199, 32201 },
            },
            szName = "Azure Dragon General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        --Azure Dragon Marshal
        [14] = {
            tbRange = {
                { 30590, 30609 },
                { 32158, 32158 },
                { 32166, 32166 },
            },
            szName = "Azure Dragon Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        [15] = {
            tbRange = {
                { 31192, 31271 },
                { 31496, 31499 },
                { 31524, 31527 },
            },
            szName = "Azure Dragon Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        [16] = {
            tbRange = {
                { 30824, 30883 },
                { 32174, 32176 },
                { 32202, 32204 },
            },
            szName = "Azure Dragon Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        --Mighty Tiger General
        [17] = {
            tbRange = {
                { 32171, 32192 },
            },
            szName = "Mighty Tiger General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        [18] = {
            tbRange = {
                { 31542, 31607 },
            },
            szName = "Mighty Tiger General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        [19] = {
            tbRange = {
                { 32219, 32284 },
            },
            szName = "Mighty Tiger General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        --Mighty Tiger Marshal
        [20] = {
            tbRange = {
                { 32193, 32214 },
            },
            szName = "Mighty Tiger Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },
        [21] = {
            tbRange = {
                { 31608, 31695 },
            },
            szName = "Mighty Tiger Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },
        [22] = {
            tbRange = {
                { 32285, 32350 },
            },
            szName = "Mighty Tiger Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },

        --Black Tortoise General
        [23] = {
            tbRange = {
                { 52259, 52280 },
            },
            szName = "Black Tortoise General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [24] = {
            tbRange = {
                { 51852, 51917 },
            },
            szName = "Black Tortoise General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [25] = {
            tbRange = {
                { 52505, 52570 },
            },
            szName = "Black Tortoise General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        --Black Tortoise Marshal
        [26] = {
            tbRange = {
                { 52281, 52302 },
            },
            szName = "Black Tortoise Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [27] = {
            tbRange = {
                { 51918, 52005 },
            },
            szName = "Black Tortoise Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [28] = {
            tbRange = {
                { 52571, 52636 },
            },
            szName = "Black Tortoise Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        --Han Vu General
        [29] = {
            tbRange = {
                { 50002, 50002 },
            },
            szName = "Han Vu General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [30] = {
            tbRange = {
                { 50002, 50013 },
            },
            szName = "Han Vu General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        --Han Vu Marshal
        [31] = {
            tbRange = {
                { 50003, 50003 },
            },
            szName = "Han Vu Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [32] = {
            tbRange = {
                { 50014, 50029 },
            },
            szName = "Han Vu Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
    },

    [LIAO_ID] = {
        -- Thunder Tiger General
        [1] = {
            tbRange = {
                { 30227, 30230 },
            },
            szName = "Thunder Tiger General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_LOIHO_TUONG,
        },
        [2] = {
            tbRange = {
                { 30193, 30204 },
            },
            szName = "Thunder Tiger General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_LOIHO_TUONG,
        },
        -- Thunder Tiger Marshal
        [3] = {
            tbRange = {
                { 30231, 30234 },
            },
            szName = "Thunder Tiger Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_LOIHO_SOAI,
        },
        [4] = {
            tbRange = {
                { 30205, 30220 },
            },
            szName = "Thunder Tiger Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_LOIHO_SOAI,
        },
        --Fire Phoenix General
        [5] = {
            tbRange = {
                { 30439, 30502 },
                { 32155, 32155 },
                { 32163, 32163 },
            },
            szName = "Fire Phoenix General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        [6] = {
            tbRange = {
                { 30676, 30867 },
                { 31500, 31502 },
                { 31528, 31530 },
            },
            szName = "Fire Phoenix General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        [7] = {
            tbRange = {
                { 30496, 30599 },
                { 32177, 32179 },
                { 32205, 32207 },
            },
            szName = "Fire Phoenix General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_TUONG,
        },
        -- Fire Phoenix Marshal
        [8] = {
            tbRange = {
                { 30503, 30566 },
                { 32156, 32156 },
                { 32164, 32164 },
            },
            szName = "Fire Phoenix Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        [9] = {
            tbRange = {
                { 30868, 31123 },
                { 31503, 31506 },
                { 31531, 31534 },
            },
            szName = "Fire Phoenix Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        [10] = {
            tbRange = {
                { 30600, 30703 },
                { 32180, 32182 },
                { 32208, 32210 },
            },
            szName = "Fire Phoenix Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HOAPHUNG_SOAI,
        },
        --Azure Dragon General
        [11] = {
            tbRange = {
                { 30611, 30630 },
                { 32159, 32159 },
                { 32167, 32167 },
            },
            szName = "Azure Dragon General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        [12] = {
            tbRange = {
                { 31274, 31333 },
                { 31507, 31509 },
                { 31535, 31537 },
            },
            szName = "Azure Dragon General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        [13] = {
            tbRange = {
                { 30904, 30963 },
                { 32183, 32185 },
                { 32211, 32213 },
            },
            szName = "Azure Dragon General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_THANHLONG_TUONG,
        },
        --Azure Dragon Marshal
        [14] = {
            tbRange = {
                { 30631, 30650 },
                { 32160, 32160 },
                { 32168, 32168 },
            },
            szName = "Azure Dragon Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        [15] = {
            tbRange = {
                { 31334, 31413 },
                { 31510, 31513 },
                { 31538, 31541 },
            },
            szName = "Azure Dragon Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        [16] = {
            tbRange = {
                { 30964, 31023 },
                { 32186, 32188 },
                { 32214, 32216 },
            },
            szName = "Azure Dragon Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_THANHLONG_SOAI,
        },
        --Mighty Tiger General
        [17] = {
            tbRange = {
                { 32215, 32236 },
            },
            szName = "Mighty Tiger General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        [18] = {
            tbRange = {
                { 31696, 31761 },
            },
            szName = "Mighty Tiger General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        [19] = {
            tbRange = {
                { 32351, 32416 },
            },
            szName = "Mighty Tiger General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_UYHO_TUONG,
        },
        --Mighty Tiger Marshal
        [20] = {
            tbRange = {
                { 32237, 32258 },
            },
            szName = "Mighty Tiger Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },
        [21] = {
            tbRange = {
                { 31762, 31849 },
            },
            szName = "Mighty Tiger Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },
        [22] = {
            tbRange = {
                { 32417, 32482 },
            },
            szName = "Mighty Tiger Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_UYHO_SOAI,
        },

        --Black Tortoise General
        [23] = {
            tbRange = {
                { 52303, 52324 },
            },
            szName = "Black Tortoise General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [24] = {
            tbRange = {
                { 52006, 52071 },
            },
            szName = "Black Tortoise General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [25] = {
            tbRange = {
                { 52637, 52702 },
            },
            szName = "Black Tortoise General Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        --Black Tortoise Marshal
        [26] = {
            tbRange = {
                { 52325, 52346 },
            },
            szName = "Black Tortoise Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [27] = {
            tbRange = {
                { 52072, 52159 },
            },
            szName = "Black Tortoise Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [28] = {
            tbRange = {
                { 52703, 52768 },
            },
            szName = "Black Tortoise Marshal Weapon",
            tbDetail = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        --Han Vu General
        [29] = {
            tbRange = {
                { 50004, 50004 },
            },
            szName = "Han Vu General Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        [30] = {
            tbRange = {
                { 50030, 50041 },
            },
            szName = "Han Vu General Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 5,
            nRequireCongTrang = CONGTRANG_HANVU_TUONG,
        },
        --Han Vu Marshal
        [31] = {
            tbRange = {
                { 50005, 50005 },
            },
            szName = "Han Vu Marshal Equipment",
            tbDetail = { 100, 101, 103 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
        [32] = {
            tbRange = {
                { 50042, 50057 },
            },
            szName = "Han Vu Marshal Accessory",
            tbDetail = { 102 },
            nRequireQuanHam = 6,
            nRequireCongTrang = CONGTRANG_HANVU_SOAI,
        },
    },
}