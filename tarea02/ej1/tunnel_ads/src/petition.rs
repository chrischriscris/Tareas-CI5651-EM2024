#[derive(Eq, PartialEq)]
pub struct Petition {
    pub id: usize,
    pub start: u32,
    pub end: u32,
}

/// Represents a petition, with its id, start and end.
impl Petition {
    /// Constructs a Petition, given its id, start and size.
    pub fn new(id: usize, start: u32, size: u32) -> Petition {
        Petition {
            id,
            start,
            end: start + size,
        }
    }
}

// Implementation of Ord and PartialOrd for petitions to be ordered by their end.

impl Ord for Petition {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        self.end.cmp(&other.end)
    }
}

impl PartialOrd for Petition {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}
