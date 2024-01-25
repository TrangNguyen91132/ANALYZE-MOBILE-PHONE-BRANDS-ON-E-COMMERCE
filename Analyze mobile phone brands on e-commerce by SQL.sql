--1. BẢNG THỐNG KÊ SỐ ĐÃ BÁN, DOANH SỐ THEO TỪNG HÃNG ĐIỆN THOẠI

UPDATE dbo.Data
SET [Thương hiệu] = 
    CASE 
        WHEN CHARINDEX('apple', [Tên sản phẩm]) > 0 THEN 'apple'
        WHEN CHARINDEX('asus', [Tên sản phẩm]) > 0 THEN 'asus'
        WHEN CHARINDEX('google', [Tên sản phẩm]) > 0 THEN 'google'
		WHEN CHARINDEX('infinix', [Tên sản phẩm]) > 0 THEN 'infinix'
		WHEN CHARINDEX('itel', [Tên sản phẩm]) > 0 THEN 'itel'
		WHEN CHARINDEX('kudixiong', [Tên sản phẩm]) > 0 THEN 'kudixiong'
		WHEN CHARINDEX('lg', [Tên sản phẩm]) > 0 THEN 'lg'
		WHEN CHARINDEX('nokia', [Tên sản phẩm]) > 0 THEN 'nokia'
		WHEN CHARINDEX('oppo', [Tên sản phẩm]) > 0 THEN 'oppo'
		WHEN CHARINDEX('poco', [Tên sản phẩm]) > 0 THEN 'poco'
		WHEN CHARINDEX('realme', [Tên sản phẩm]) > 0 THEN 'realme'
		WHEN CHARINDEX('redmi', [Tên sản phẩm]) > 0 THEN 'redmi'
		WHEN CHARINDEX('samsung', [Tên sản phẩm]) > 0 THEN 'samsung'
		WHEN CHARINDEX('sony', [Tên sản phẩm]) > 0 THEN 'sony'
		WHEN CHARINDEX('tecno', [Tên sản phẩm]) > 0 THEN 'tecno'
		WHEN CHARINDEX('vertu', [Tên sản phẩm]) > 0 THEN 'vertu'
		WHEN CHARINDEX('vivo', [Tên sản phẩm]) > 0 THEN 'vivo'
		WHEN CHARINDEX('vsmart', [Tên sản phẩm]) > 0 THEN 'vsmart'
		WHEN CHARINDEX('xiaomi', [Tên sản phẩm]) > 0 THEN 'xiaomi'
		WHEN CHARINDEX('galaxy', [Tên sản phẩm]) > 0 THEN 'samsung'
        ELSE NULL
    END;
 
UPDATE dbo.Data
SET [Link shop] =
	REPLACE([Link shop], 'https://www.', 'https://')
	WHERE [Link shop] LIKE 'https://www.%';
WITH short_data_table AS (
SELECT 
	[Tên sản phẩm], [Ngành hàng], [Thương hiệu]
	, CASE
		WHEN [Thương hiệu] IN ('apple', 'google') THEN 'USA'
		WHEN [Thương hiệu] IN ('asus') THEN 'Taiwan'
		WHEN [Thương hiệu] IN ('samsung', 'lg') THEN 'Korea'
		WHEN [Thương hiệu] IN ('nokia') THEN 'Findland'
		WHEN [Thương hiệu] IN ('sony') THEN 'Japan'
		WHEN [Thương hiệu] IN ('vertu') THEN 'UK'
		WHEN [Thương hiệu] IN ('vsmart') THEN 'Vietnam'
		WHEN [Thương hiệu] IN ('oppo', 'xiaomi', 'infinix', 'itel', 'kudixiong', 'poco', 'realme', 'redmi', 'tecno', 'vivo') THEN 'China'
		ELSE NULL 
	END AS 'Xuất xứ'
	, SUBSTRING(
		[Link shop], 
		CHARINDEX('https://', [Link shop]) + LEN('https://'), 
		CHARINDEX('.', [Link shop], CHARINDEX('https://', [Link shop])) - (CHARINDEX('https://', [Link shop]) + LEN('https://')) 
			) AS 'Tên sàn điện tử'
	, CASE 
		WHEN [Thương hiệu] = 'samsung' AND CHARINDEX('s23', [Tên sản phẩm]) > 0 THEN 'samsung galaxy s23'
		WHEN [Thương hiệu] != 'samsung' THEN [Thương hiệu]
		ELSE 'samsung-others' 
	END AS 'Phân loại SS'
	, [Số đã bán],[Doanh thu]
FROM dbo.Data
WHERE [Ngành hàng] IN (N'Chưa phân loại', N'Điện Thoại & Máy Tính Bảng')
)
SELECT [Thương hiệu]
	, SUM([Số đã bán]) AS [Số lượng theo thương hiệu]
	, SUM([Doanh thu]) AS [Doanh thu theo thương hiệu]
FROM short_data_table
GROUP BY [Thương hiệu]
ORDER BY 2 DESC


--2. ĐIỆN THOẠI CỦA NƯỚC NÀO BÁN CHẠY NHẤT? TRUNG QUỐC, MỸ HAY HÀN? ĐƯA RA BẢNG THỐNG KÊ THỂ HIỆN KẾT LUẬN NÀY
--3. ĐIỆN THOẠI CỦA NƯỚC NÀO CÓ DOANH SỐ BÁN TỐT NHẤT?  TRUNG QUỐC, MỸ HAY HÀN? ĐƯA RA BẢNG THỐNG KÊ THỂ HIỆN KẾT LUẬN NÀY
UPDATE dbo.Data
SET [Thương hiệu] = 
    CASE 
        WHEN CHARINDEX('apple', [Tên sản phẩm]) > 0 THEN 'apple'
        WHEN CHARINDEX('asus', [Tên sản phẩm]) > 0 THEN 'asus'
        WHEN CHARINDEX('google', [Tên sản phẩm]) > 0 THEN 'google'
		WHEN CHARINDEX('infinix', [Tên sản phẩm]) > 0 THEN 'infinix'
		WHEN CHARINDEX('itel', [Tên sản phẩm]) > 0 THEN 'itel'
		WHEN CHARINDEX('kudixiong', [Tên sản phẩm]) > 0 THEN 'kudixiong'
		WHEN CHARINDEX('lg', [Tên sản phẩm]) > 0 THEN 'lg'
		WHEN CHARINDEX('nokia', [Tên sản phẩm]) > 0 THEN 'nokia'
		WHEN CHARINDEX('oppo', [Tên sản phẩm]) > 0 THEN 'oppo'
		WHEN CHARINDEX('poco', [Tên sản phẩm]) > 0 THEN 'poco'
		WHEN CHARINDEX('realme', [Tên sản phẩm]) > 0 THEN 'realme'
		WHEN CHARINDEX('redmi', [Tên sản phẩm]) > 0 THEN 'redmi'
		WHEN CHARINDEX('samsung', [Tên sản phẩm]) > 0 THEN 'samsung'
		WHEN CHARINDEX('sony', [Tên sản phẩm]) > 0 THEN 'sony'
		WHEN CHARINDEX('tecno', [Tên sản phẩm]) > 0 THEN 'tecno'
		WHEN CHARINDEX('vertu', [Tên sản phẩm]) > 0 THEN 'vertu'
		WHEN CHARINDEX('vivo', [Tên sản phẩm]) > 0 THEN 'vivo'
		WHEN CHARINDEX('vsmart', [Tên sản phẩm]) > 0 THEN 'vsmart'
		WHEN CHARINDEX('xiaomi', [Tên sản phẩm]) > 0 THEN 'xiaomi'
		WHEN CHARINDEX('galaxy', [Tên sản phẩm]) > 0 THEN 'samsung'
        ELSE NULL
    END;
 
UPDATE dbo.Data
SET [Link shop] =
	REPLACE([Link shop], 'https://www.', 'https://')
	WHERE [Link shop] LIKE 'https://www.%';
WITH short_data_table AS (
SELECT 
	[Tên sản phẩm], [Ngành hàng], [Thương hiệu]
	, CASE
		WHEN [Thương hiệu] IN ('apple', 'google') THEN 'USA'
		WHEN [Thương hiệu] IN ('asus') THEN 'Taiwan'
		WHEN [Thương hiệu] IN ('samsung', 'lg') THEN 'Korea'
		WHEN [Thương hiệu] IN ('nokia') THEN 'Findland'
		WHEN [Thương hiệu] IN ('sony') THEN 'Japan'
		WHEN [Thương hiệu] IN ('vertu') THEN 'UK'
		WHEN [Thương hiệu] IN ('vsmart') THEN 'Vietnam'
		WHEN [Thương hiệu] IN ('oppo', 'xiaomi', 'infinix', 'itel', 'kudixiong', 'poco', 'realme', 'redmi', 'tecno', 'vivo') THEN 'China'
		ELSE NULL 
	END AS 'Xuất xứ'
	, SUBSTRING(
		[Link shop], 
		CHARINDEX('https://', [Link shop]) + LEN('https://'), 
		CHARINDEX('.', [Link shop], CHARINDEX('https://', [Link shop])) - (CHARINDEX('https://', [Link shop]) + LEN('https://')) 
			) AS 'Tên sàn điện tử'
	, CASE 
		WHEN [Thương hiệu] = 'samsung' AND CHARINDEX('s23', [Tên sản phẩm]) > 0 THEN 'samsung galaxy s23'
		WHEN [Thương hiệu] != 'samsung' THEN [Thương hiệu]
		ELSE 'samsung-others' 
	END AS 'Phân loại SS'
	, [Số đã bán],[Doanh thu]
FROM dbo.Data
WHERE [Ngành hàng] IN (N'Chưa phân loại', N'Điện Thoại & Máy Tính Bảng')
)
SELECT [Xuất xứ]
	, SUM([Số đã bán]) AS [Số lượng đã bán theo xuất xứ]
	, SUM([Doanh thu]) AS [Doanh thu theo xuất xứ]
FROM short_data_table
GROUP BY [Xuất xứ]
ORDER BY 3 DESC


--4. TỶ LỆ VỀ DOANH SỐ, SỐ ĐÃ BÁN CỦA ĐIỆN THOẠI SAMSUNG GALAXY S23 SO VỚI CÁC ĐIỆN THOẠI KHÁC CỦA SAMSUNG TRÊN SÀN SHOPEE
UPDATE dbo.Data
SET [Thương hiệu] = 
    CASE 
        WHEN CHARINDEX('apple', [Tên sản phẩm]) > 0 THEN 'apple'
        WHEN CHARINDEX('asus', [Tên sản phẩm]) > 0 THEN 'asus'
        WHEN CHARINDEX('google', [Tên sản phẩm]) > 0 THEN 'google'
		WHEN CHARINDEX('infinix', [Tên sản phẩm]) > 0 THEN 'infinix'
		WHEN CHARINDEX('itel', [Tên sản phẩm]) > 0 THEN 'itel'
		WHEN CHARINDEX('kudixiong', [Tên sản phẩm]) > 0 THEN 'kudixiong'
		WHEN CHARINDEX('lg', [Tên sản phẩm]) > 0 THEN 'lg'
		WHEN CHARINDEX('nokia', [Tên sản phẩm]) > 0 THEN 'nokia'
		WHEN CHARINDEX('oppo', [Tên sản phẩm]) > 0 THEN 'oppo'
		WHEN CHARINDEX('poco', [Tên sản phẩm]) > 0 THEN 'poco'
		WHEN CHARINDEX('realme', [Tên sản phẩm]) > 0 THEN 'realme'
		WHEN CHARINDEX('redmi', [Tên sản phẩm]) > 0 THEN 'redmi'
		WHEN CHARINDEX('samsung', [Tên sản phẩm]) > 0 THEN 'samsung'
		WHEN CHARINDEX('sony', [Tên sản phẩm]) > 0 THEN 'sony'
		WHEN CHARINDEX('tecno', [Tên sản phẩm]) > 0 THEN 'tecno'
		WHEN CHARINDEX('vertu', [Tên sản phẩm]) > 0 THEN 'vertu'
		WHEN CHARINDEX('vivo', [Tên sản phẩm]) > 0 THEN 'vivo'
		WHEN CHARINDEX('vsmart', [Tên sản phẩm]) > 0 THEN 'vsmart'
		WHEN CHARINDEX('xiaomi', [Tên sản phẩm]) > 0 THEN 'xiaomi'
		WHEN CHARINDEX('galaxy', [Tên sản phẩm]) > 0 THEN 'samsung'
        ELSE NULL
    END;
 
UPDATE dbo.Data
SET [Link shop] =
	REPLACE([Link shop], 'https://www.', 'https://')
	WHERE [Link shop] LIKE 'https://www.%';
WITH short_data_table AS (
SELECT 
	[Tên sản phẩm], [Ngành hàng], [Thương hiệu]
	, CASE
		WHEN [Thương hiệu] IN ('apple', 'google') THEN 'USA'
		WHEN [Thương hiệu] IN ('asus') THEN 'Taiwan'
		WHEN [Thương hiệu] IN ('samsung', 'lg') THEN 'Korea'
		WHEN [Thương hiệu] IN ('nokia') THEN 'Findland'
		WHEN [Thương hiệu] IN ('sony') THEN 'Japan'
		WHEN [Thương hiệu] IN ('vertu') THEN 'UK'
		WHEN [Thương hiệu] IN ('vsmart') THEN 'Vietnam'
		WHEN [Thương hiệu] IN ('oppo', 'xiaomi', 'infinix', 'itel', 'kudixiong', 'poco', 'realme', 'redmi', 'tecno', 'vivo') THEN 'China'
		ELSE NULL 
	END AS 'Xuất xứ'
	, SUBSTRING(
		[Link shop], 
		CHARINDEX('https://', [Link shop]) + LEN('https://'), 
		CHARINDEX('.', [Link shop], CHARINDEX('https://', [Link shop])) - (CHARINDEX('https://', [Link shop]) + LEN('https://')) 
			) AS 'Tên sàn điện tử'
	, CASE 
		WHEN [Thương hiệu] = 'samsung' AND CHARINDEX('s23', [Tên sản phẩm]) > 0 THEN 'samsung galaxy s23'
		WHEN [Thương hiệu] != 'samsung' THEN [Thương hiệu]
		ELSE 'samsung-others' 
	END AS 'Phân loại SS'
	, [Số đã bán],[Doanh thu]
FROM dbo.Data
WHERE [Ngành hàng] IN (N'Chưa phân loại', N'Điện Thoại & Máy Tính Bảng')
)
, pct_SS_table AS (
SELECT [Phân loại SS]
	, SUM([Số đã bán]) AS [Số lượng từng dòng SS trên shopee]
	, SUM([Doanh thu]) AS [Doanh thu từng dòng SS trên shopee]
	, (SELECT SUM([Số đã bán]) FROM short_data_table WHERE [Thương hiệu] = 'samsung' AND [Tên sàn điện tử] = 'shopee') AS [Số lượng SS trên shopee]
	, (SELECT SUM([Doanh thu]) FROM short_data_table WHERE [Thương hiệu] = 'samsung' AND [Tên sàn điện tử] = 'shopee') AS [Doanh thu SS trên shopee]
FROM short_data_table
WHERE [Thương hiệu] = 'samsung' AND [Tên sàn điện tử] = 'shopee'
GROUP BY [Phân loại SS]
)
SELECT *
	, FORMAT([Số lượng từng dòng SS trên shopee] * 1.0/[Số lượng SS trên shopee], 'p') AS [Tỷ lệ số lượng đã bán SS GLX S23]
	, FORMAT([Doanh thu từng dòng SS trên shopee] * 1.0/[Doanh thu SS trên shopee], 'p') AS [Tỷ lệ doanh thu SS GLX S23]
FROM pct_SS_table
ORDER BY 2 DESC