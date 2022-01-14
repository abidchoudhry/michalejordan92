--which opponents did mike see the most
select count(opp), opp
from mike92
group by opp
order by count(opp) desc

--max points mike scored against each team he faced, the date, and if he won or loss
WITH mikecte as
(
  SELECT Opp, Pts, W_L, Date, rn = ROW_NUMBER() 
    OVER (PARTITION BY Opp ORDER BY Pts desc, Date)
  FROM mike92
)
SELECT * FROM mikecte WHERE rn = 1
order by pts desc

--find mikes field goal percenatge against each team, 3 point percenatge, Free Throw Percentage, and # of times he played each team
select count(opp)  #of_times_played, opp, SUM(FGM)/SUM(FGA)* 100 as [FG%], SUM([3PM])/NULLIF (SUM([3PA]), 0)*100 as [3P%], SUM(FTM)/NULLIF (SUM(FTA), 0)* 100 as [FT%]
from mike92
group by Opp


--same as the last prompt but find stats from home and road

select count(H_r)  #of_times_played, H_r, SUM(FGM)/SUM(FGA)* 100 as [FG%], SUM([3PM])/NULLIF (SUM([3PA]), 0)*100 as [3P%], SUM(FTM)/NULLIF (SUM(FTA), 0)* 100 as [FT%]
from mike92
group by H_r

-- average # of points scored against each team

select opp, avg(pts) as avgpts_scored
from mike92
group by Opp
order by AVG(pts) desc



