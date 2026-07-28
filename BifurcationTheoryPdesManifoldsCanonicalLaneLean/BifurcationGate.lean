import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationAdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
