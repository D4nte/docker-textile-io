
1. `git clone git@github.com:D4nte/docker-textile-io.git`
2. `cd docker-textile-io` 
3. `docker build . -t textile`
4.a. First time: `docker run -it textile`. Be sure to save your mnemonic and seed
4.b. Following times: `docker run -it textile --seed <your seed>`
