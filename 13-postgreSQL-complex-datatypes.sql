
SELECT (
(2::INTEGER + 2::INTEGER) 
* 
(32::INTEGER + 65::INTEGER)) AS SUM;

-- ---------------------------------------------------------
SELECT (
    
    'My name is aein'::VARCHAR(50),
    ABS(23.5432:: NUMERIC - 32.5434::NUMERIC)

   ) AS Records

-- --------------------------------------------------------


SELECT (12.54334432344::INTEGER) AS Compeare
-----------------------------------------------------------

SELECT 
    
    'EEEEEE'::CHAR(3) AS CHAR_TEST,
     'my name is ayin mannani'::VARCHAR(50) AS VARCHAR_TEST


---------------------------------------------------------
-- Boolean

SELECT 'yes'::BOOLEAN AS Tes_Check_True,
        'on'::BOOLEAN AS On_Check_True,
        TRUE::BOOLEAN AS True_Check_True,
        1::BOOLEAN AS Number_Chec_Truek,
        't'::BOOLEAN AS CHAR_Check1_True,
        'y'::BOOLEAN AS CHAR_Check2_True


SELECT
       'no'::BOOLEAN AS Test_Check_False,
       'off'::BOOLEAN AS Test_check_False,
        FALSE::BOOLEAN AS False_Check_False,
        0::BOOLEAN AS Number_Check_False,
        'f'::BOOLEAN AS Char_Check_False,
        'n'::BOOLEAN AS Char_Check_False

SELECT null::BOOLEAN AS Nullage_value        
----------------------------------------------------------------------------------

SELECT
       'NOV-20-1997'::DATE AS Date_exapmle1,
       'NOV 20 1997'::DATE AS Date_exapmle2,
       '05:54'::TIME AS Time_example1,
       '05:54:23 PM'::TIME AS Time_example2,
       '08:32:12 AM EST'::TIME WITH TIME ZONE AS Time_Conver_USA,
       '00:05:12 AM PST'::TIME WITH TIME ZONE AS Time_Conver_STANDARD,
       '00:05:12 AM UTC'::TIME WITH TIME ZONE AS Time_Conver_utc,
       'NOV-14-1997 01:43 PM PST'::TIMESTAMP WITH TIME ZONE AS Time_Conver_utc
--------------------------------------------------------------------------

SELECT
       '1 D'::INTERVAL AS day_show_message,
       '1 D 20 H'::INTERVAL AS day_houre_show_message,
       '1 D 20 H 45 M 05 S'::INTERVAL AS day_houre_minute_secound_show_message


SELECT
        ('1 D 20 H 45 M 05 S'::INTERVAL) - ('1 D'::INTERVAL) AS Minuse_vidget,
        ('NOV-14-1997 01:43 PM EST'::TIMESTAMP WITH TIME ZONE)
        -
        ('10 D'::INTERVAL)
        ,
        ('NOV-20-1997 01:43 PM EST'::TIMESTAMP WITH TIME ZONE)
        -
        ('NOV-10-1997 08:43 AM PST'::TIMESTAMP WITH TIME ZONE)