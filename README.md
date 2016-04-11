# Node.JS On Build Container

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-nodejs.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-nodejs)

This is an onbuild container for Node.JS Projects. 

## Usage  

This docker container is an `ONBUILD`. Simply extend the Dockerfile in your application with this Dockerfile and your 
project will be copied into the `/app` directory and have `npm install` run on it.  You must ensure that your 
downstream images sets USER nodejs and additionally in rare cases any required permission beyond read.

Please note, storing state on this container is not recommended, and logs should be written to stdout, thus adding further 
permissions isn't something we'd normally envision.

### Container Parameters

* `start`, `test` or `run` will run `npm COMMAND`

The following command will run `npm start` on the code within the container

So if your Dockerfile looks like this
```shell
FROM quay.io/ukhomeofficedigital/nodejs:v3.0.0

USER nodejs
CMD ["start"]
```

The following will run `npm start`:

```shell
docker run your-docker-container:latest
```

You can also run arbitrary commands such as:

```shell
docker run your-docker-container:latest /opt/nodejs/bin/npm run 
```

However, we'd prefered there was a standard way to start your app and thus,
have settled on `npm start` being the canonical way to run your app.


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

* Node v4.4.2

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
