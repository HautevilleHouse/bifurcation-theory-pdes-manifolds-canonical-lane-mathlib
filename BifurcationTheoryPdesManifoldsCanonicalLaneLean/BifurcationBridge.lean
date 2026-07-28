import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationAdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
