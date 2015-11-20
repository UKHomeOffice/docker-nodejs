# Node.JS On Build Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-nodejs.svg?branch=added-travis)](https://travis-ci.org/UKHomeOffice/docker-nodejs)

This is an onbuild container for Node.JS Projects.

## Usage

This docker container is an `ONBUILD`. Simply extend the Dockerfile in your application with this Dockerfile and your 
project will be copied into the `/app` directory and have `npm install` run on it.

### Container Parameters

* `start`, `test` or `run` will run `npm COMMAND`

The following command will run `npm start` on the code within the container

So if your Dockerfile looks like this
```shell
FROM quay.io/ukhomeofficedigital/nodejs:v1.0.0

CMD ["start"]
```

The following will run `npm start`.

```shell
docker run your-docker-container:latest
```

You may also run arbitrary commands

```shell
docker run -it quay.io/ukhomeofficedigital/nodejs:v1.0.0 bash
```


### Useful Directories

* `/app` - Where you app will be copied to on build

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to 
discuss it in an issue first.

Please note that this project is released with a 
[Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-nodejs/blob/master/CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for the version tags available See the tags on this repository. 

## Build With

* Node v4.2.2

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of 
[contributors](https://github.com/UKHomeOffice/docker-nodejs/graphs/contributors) who participated 
in this project.

## License

This project is licensed under the GPL v2 License - see the 
[LICENSE.md](https://github.com/UKHomeOffice/docker-nodejs/blob/master/LICENSE.md) file for details

## Acknowledgments

* [NodeJS](https://nodejs.org/)
