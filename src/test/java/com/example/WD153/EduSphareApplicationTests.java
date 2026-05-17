package com.example.janani;

import com.example.janani.model.User;
import com.example.janani.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class JananiApplicationTests {

	@Autowired
	private UserService userService;

	@Test
	void contextLoads() {
	}

	@Test
	void testRegisterAndLogin() {
		User user = new User();
		user.setFullname("Test User");
		user.setEmail("test@example.com");
		user.setPassword("password123");
		
		userService.registerUser(user);
		
		Optional<User> loggedInUser = userService.loginUser("test@example.com", "password123");
		assertTrue(loggedInUser.isPresent());
		assertEquals("Test User", loggedInUser.get().getFullname());
	}

}
