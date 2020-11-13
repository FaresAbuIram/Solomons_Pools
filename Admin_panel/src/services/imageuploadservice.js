const cloudinary = require('cloudinary').v2;
const multer = require('multer');
const fs = require('fs');
require('dotenv/config');

// Local storage configuration

const storage = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, 'src/public/upload/');
	},
	filename: function (req, file, cb) {
		/**
		 * If files has the same name it will be identified by the random string
		 */
		let randomString = Math.random().toString(36);
		cb(null, randomString + file.originalname);
	},
});

const uploadLocalStorage = multer({ storage }).fields([
	{ name: `profilePicture` },
	{ name: `event` },
]);

// Cloudinary configuration
cloudinary.config({
	cloud_name: process.env.CLOUD_NAME,
	api_key: process.env.CLOUD_KEY,
	api_secret: process.env.CLOUD_SECRET,
});

/**
 * function to store files in cloudinary website
 * @param path: path for required image in the server
 * @param tag: string to identify type of image
 */
function uploadCloudinary(path, tag) {
    
	// create unique name for image to store in cloudinary
	let randomString = Math.random().toString(36);
	const uniqueFilename = `${randomString}-${new Date().toISOString()}`;

	return new Promise((resolve, reject) => {
		cloudinary.uploader.upload(
			path,
			{ public_id: `${tag}/${uniqueFilename}`, tags: tag }, // directory and tags are optional
			function (error, image) {
				// remove file from server
				fs.unlinkSync(path);
                if (error) reject(error);
                
				resolve({
					url: image.url,
					id: image.public_id,
				});
			}
		);
	});
}

/**
 * function to delete files in cloudinary website
 * @param image: unique name to identify image to delete
 */

function destroyCloudinary(image) {
	cloudinary.uploader.destroy(image, function (error, result) {
		console.log(result, error);
	});
}

module.exports = {
	uploadCloudinary,
	uploadLocalStorage,
	destroyCloudinary,
};