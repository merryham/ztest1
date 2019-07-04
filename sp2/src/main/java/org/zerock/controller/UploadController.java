package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("update ajax get");
		
	}
	
	@GetMapping("/viewImage")
	public @ResponseBody ResponseEntity<byte[]> viewImage(String file){
		
		ResponseEntity<byte[]> result = null;
		
		try {
			File targetFile = new File("C:\\upload", file);
			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(targetFile.toPath()) );
			
			byte[] arr = FileCopyUtils.copyToByteArray(targetFile);
			
			result = new ResponseEntity<>(arr, header, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	@PostMapping( value =  "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody ResponseEntity<List<AttachDTO>> uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload";
		
		List<AttachDTO> list = new ArrayList<>();

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			AttachDTO fileData = new AttachDTO();
			
			UUID uuid = UUID.randomUUID();
			
			fileData.setUuid(uuid.toString());
			
			String uploadFileName = uuid+"_"+ multipartFile.getOriginalFilename();
			
			fileData.setFileName(multipartFile.getOriginalFilename());
			
			list.add(fileData);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			FileOutputStream thumbnail = null;  
		    try {
		      multipartFile.transferTo(saveFile);
		      
		      thumbnail = new FileOutputStream(
		    		   new File(uploadFolder, "s_"+ uploadFileName) );
		      
		      Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

		      
		    } catch (Exception e) {
		      log.error(e.getMessage());
		    } finally {
		    	try { thumbnail.close(); }catch(Exception e) {}
		    }
		}//end for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	

}
