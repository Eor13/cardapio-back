package com.cardapio.controller;

import com.cardapio.dto.FoodRequestDTO;
import com.cardapio.dto.FoodResponseDTO;
import com.cardapio.food.Food;
import com.cardapio.repository.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("food")
public class FoodController {
    @Autowired
    private FoodRepository foodRepository;

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @GetMapping
    public List<FoodResponseDTO> getAll(){
        List<FoodResponseDTO> foodList;
        foodList = foodRepository.findAll().stream().map(FoodResponseDTO::new).toList();
        return foodList;
    }

    @CrossOrigin(origins = "*", allowedHeaders = "*") //verifica origem e reders ativados
    @PostMapping
    public void savedFood(@RequestBody FoodRequestDTO data){
        Food foodData = new Food(data);
        foodRepository.save(foodData);
        return;
    }

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @DeleteMapping("/{foodId}")
    public void DeleteFood(@PathVariable("foodId") Long id){
       foodRepository.deleteById(id);
       return;
    }

    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @DeleteMapping
    public void DeleteFood(){
        foodRepository.deleteAll();
        return;
    }
}
