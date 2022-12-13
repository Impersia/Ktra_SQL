--CÂU 2:
SELECT TOP 1 (SLBan* DonGia) AS 'TONG TIEN ', MAHD
 FROM  HangXuat
 ORDER BY [TONG TIEN ] DESC
 --câu 3:
 CREATE FUNCTION f3 (
    @MAHD varchar(10)
)
RETURNS TABLE
AS
RETURN
    SELECT 
        HX.MAHD,
        HD.NgayXuat,
        HD.MAVT,
        HX.DonGia,
        HX.SLBan,  
        CASE
            WHEN WEEKDAY(HD.NgayXuat) = 0 THEN N'Thứ hai'            
            WHEN WEEKDAY(HD.NgayXuat) = 1 THEN N'Thứ ba'
            WHEN WEEKDAY(HD.NgayXuat) = 2 THEN N'Thứ tư'
            WHEN WEEKDAY(HD.NgayXuat) = 3 THEN N'Thứ năm'
            WHEN WEEKDAY(HD.NgayXuat) = 4 THEN N'Thứ sáu'
            WHEN WEEKDAY(HD.NgayXuat) = 5 THEN N'Thứ bảy'
            ELSE N'Chủ nhật'
        END AS NGAYTHU
    FROM HangXuat HX
    INNER JOIN HDBan HD ON HX.MAHD = HD.MAHD
    WHERE HX.MAHD = @MAHD;

--câu 4:
CREATE PROCEDURE p4 
@thang int, @nam int 
AS
SELECT 
SUM(SLBan * DonGia)
FROM HangXuat HX
INNER JOIN HDBan HD ON HX.MAHD = HD.MAHD
where MONTH(HD.NgayXuat) = @THANG AND YEAR(HD.NgayXuat) = @NAM;
