package moimmoimProject.service.moimService;

import moimmoimProject.Repository.MoimRepository;
import moimmoimProject.domain.moim.Moim;

import java.util.List;

public interface MoimService {

    void create(Moim moim);
    Moim findMoim(Long moim_num);
    List<Moim> moims();
    Moim findMoimByCat(int category_num);
}
