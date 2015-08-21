# Node.JS On Build Container

This is an onbuild container for Node.JS Projects.

## Assumptions

We can do an `npm install` in the root of the project.

The `ENTRYPOINT` and `CMD` is set to run `npm start`. You can override this if needed (see example).

## Example

```shell
FROM quay.io/ukhomeofficedigital/nodejs:v0.2.0

ENTRYPOINT ["node"]
CMD ["start.js"]
```
## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to 
discuss it in an issue first.

Please note that this project is released with a 
[Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-nodejs/blob/master/CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for the version tags available See the tags on this repository. 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of 
[contributors](https://github.com/UKHomeOffice/docker-nodejs/graphs/contributors) who participated 
in this project.

## License

This project is licensed under the MIT License - see the 
[LICENSE.md](https://github.com/UKHomeOffice/docker-nodejs/blob/master/LICENSE.md) file for details

## Acknowledgments

* [NodeJS](https://nodejs.org/)
* [libsass](https://github.com/sass/libsass)
