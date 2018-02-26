# README

## git_stats

Gem to return stats from a Github repository

### Executing Gem

#### With Docker

1. Install Docker Compose

https://docs.docker.com/compose/install/

2. Start container running with bash

```
docker-compose run app bash
```

3. In the container, run

```
ruby -Ilib ./bin/git_stats [REPOSITITORY_OWNER] [REPOSITORY_NAME]
```

#### With RVM

1. Install RVM

https://rvm.io/rvm/install

2. Load project RVM

```
rvm use
```

3. Export Github URL environment variable

```
export GITHUB_API=https://api.github.com
```

4. Run gem bin

```
ruby -Ilib ./bin/git_stats [REPOSITITORY_OWNER] [REPOSITORY_NAME]
```

#### Dinda-com-br/braspag-rest in Docker

1. Install Docker Compose

https://docs.docker.com/compose/install/

2. Run

```
./scripts/git_stats.sh
```
