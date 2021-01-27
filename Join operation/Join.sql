## 1. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'.
SELECT matchid, player FROM goal 
  WHERE teamid= 'GER';
  
## 2. Show id, stadium, team1, team2 for just game 1012.
SELECT id,stadium,team1,team2
  FROM game where id = '1012';
  
## 3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid) where teamid = 'GER';
  
## 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
Select team1, team2,player 
from game join goal on id=matchid where player like 'Mario%';

## 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10.
SELECT player, teamid,coach, gtime
  FROM goal join eteam on teamid=id
 WHERE gtime<=10;
 
## 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
Select mdate,teamname 
from game join eteam on team1=eteam.id where coach='Fernando Santos';

## 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
select player 
from game join goal on id=matchid where stadium Like '%Warsaw';

## 8. Instead show the name of all players who scored a goal against Germany.
SELECT Distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' or team2='GER') and (teamid!='GER');
    
## 9. Show teamname and the total number of goals scored.
SELECT teamname, count(matchid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;
 
## 10. Show the stadium and the number of goals scored in each stadium.
select stadium, count(matchid) 
from game join goal on id=matchid group by stadium;

## 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate,count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') group by 1,2;
 
## 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select matchid, mdate,count(teamid) 
from game join goal on id=matchid 
where (team1='GER' or team2='GER') and (teamid='GER') group by 1,2;

## 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.Sort your result by mdate, matchid, team1 and team2.
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
  team2,
  sum(CASE WHEN teamid=team2 then 1 else 0 end) as score2
  FROM game left JOIN goal ON id = matchid
  group by mdate,matchid,team1,team2;

  
