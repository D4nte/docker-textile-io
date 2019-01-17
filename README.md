
## Use at your own risk

The retrieval/backup of seeds is not as straightforward with docker so use at your own risk.

Better to use if you know what you are doing but too lazy to create your own docker image.

Contributions welcome.


# Local image build

1. `git clone git@github.com:D4nte/docker-textile-io.git`
2. `cd docker-textile-io` 
3. `docker build . -t textile`
4. First time: `docker run -it textile`. Be sure to save your mnemonic and seed
5. Following times: `docker run textile --seed <your seed>`
