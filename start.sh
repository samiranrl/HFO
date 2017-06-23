for i in `seq $2 100`

do

a=$1
b=$(($1+1))
c=$(($1+2))

( cd example/sarsa_offense && cp weights_$a* weights_backup && cp weights_$b* weights_backup && cp weights_$c* weights_backup ) 

echo "Train $i" >> train$1.txt
stdbuf -oL ./bin/HFO  --offense-agents 3 --defense-npcs 2 --headless --no-logging --trials 1000 --seed $1 --port $1>> train$1.txt &
sleep 5
( cd example/sarsa_offense && ./high_level_sarsa_agent --learnRate .05 --numAgents 3 --numEpisodes 1000 --basePort $1 ) 



wait

echo "Test $i" >> test$1.txt
stdbuf -oL ./bin/HFO  --offense-agents 3 --defense-npcs 2 --headless --no-logging --trials 15000 --seed $1 --port $1 >> test$1.txt &
sleep 5
( cd example/sarsa_offense && ./high_level_sarsa_agent --learnRate 0 --eps 0 --numAgents 3 --numEpisodes 15000 --basePort $1 )
wait




done
