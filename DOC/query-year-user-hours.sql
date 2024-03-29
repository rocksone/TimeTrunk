 SELECT
    UDAY,
    KOMMT1,
    KOMMT2,
    Pause,
    IST,
    SOLL,
    SUM(DIFF) OVER (ORDER BY UDAY) AS RunningTotal_DIFF,
    SUM(DIFF) OVER (ORDER BY UDAY) / 60 AS RunningTotal_DIFF_Hours,
    mod(SUM(DIFF) OVER (ORDER BY UDAY), 60) AS mod

FROM
    (SELECT UDAY, USERYEAR_ID,
        COALESCE(EXTRACT(HOUR FROM GOES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES1),0) - COALESCE(EXTRACT(HOUR FROM COMES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES1),0) AS KOMMT1,
        COALESCE(EXTRACT(HOUR FROM GOES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES2),0) - COALESCE(EXTRACT(HOUR FROM COMES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES2),0) AS KOMMT2,
        COALESCE(EXTRACT(HOUR FROM PAUSE),0) * 60 + COALESCE(EXTRACT(MINUTE FROM PAUSE),0) AS Pause,
        COALESCE(EXTRACT(HOUR FROM GOES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES1),0) - COALESCE(EXTRACT(HOUR FROM COMES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES1),0) +
        COALESCE(EXTRACT(HOUR FROM GOES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES2),0) - COALESCE(EXTRACT(HOUR FROM COMES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES2),0) -
        COALESCE(EXTRACT(HOUR FROM PAUSE),0) * 60 - COALESCE(EXTRACT(MINUTE FROM PAUSE),0) AS IST,
        COALESCE(UHOURS,0) AS SOLL,
        (COALESCE(EXTRACT(HOUR FROM GOES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES1),0) - COALESCE(EXTRACT(HOUR FROM COMES1),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES1),0) +
        COALESCE(EXTRACT(HOUR FROM GOES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM GOES2),0) - COALESCE(EXTRACT(HOUR FROM COMES2),0) * 60 + COALESCE(EXTRACT(MINUTE FROM COMES2),0) -
        COALESCE(EXTRACT(HOUR FROM PAUSE),0) * 60) - COALESCE(EXTRACT(MINUTE FROM PAUSE),0) - COALESCE(UHOURS,0) AS DIFF
    FROM SYS_USERYEARDAT) AS subquery_alias
where    USERYEAR_ID = :USERYEAR_ID;
