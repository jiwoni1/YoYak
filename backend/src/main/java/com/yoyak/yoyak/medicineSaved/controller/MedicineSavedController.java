package com.yoyak.yoyak.medicineSaved.controller;

import com.yoyak.yoyak.medicineSaved.dto.MedicineFromEnvelopeRemovalDto;
import com.yoyak.yoyak.medicineSaved.dto.MedicineToEnvelopRegistrationDto;
import com.yoyak.yoyak.medicineSaved.service.MedicineSavedService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/medicineSaved")
@RequiredArgsConstructor
@Slf4j
public class MedicineSavedController {

    private final MedicineSavedService medicineSavedService;

    /**
     * 약 봉투에 약을 추가하는 메소드
     *
     * @param requestDto
     * @return ResponseEntity<HttpStatusCode>
     */
    @PostMapping()
    public ResponseEntity<HttpStatusCode> addMedicineToEnvelop(
        @RequestBody MedicineToEnvelopRegistrationDto requestDto) {

        log.info("addMedicineToEnvelop={}", requestDto);
        medicineSavedService.addMedicineToEnvelop(requestDto);

        return ResponseEntity
            .status(HttpStatus.OK)
            .build();
    }

    /**
     * 약 봉투에서 약을 삭제하는 메소드
     *
     * @param requestDto
     * @return ResponseEntity<HttpStatusCode>
     */
    @DeleteMapping
    public ResponseEntity<HttpStatusCode> deleteMedicineToEnvelop(
        @RequestBody MedicineFromEnvelopeRemovalDto requestDto) {

        log.info("deleteMedicineToEnvelop={}", requestDto);
        medicineSavedService.deleteMedicineToEnvelop(requestDto);

        return ResponseEntity
            .status(HttpStatus.OK)
            .build();
    }
}
